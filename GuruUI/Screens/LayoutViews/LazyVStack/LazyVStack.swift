import SwiftUI

struct LazyVStackContentView<ViewModel: LazyVStackViewModel>: View {
    @StateObject var model: ViewModel
    @ObservedObject var breedFetcher: BreedFetcher
    
    let imageSize: CGFloat = 300
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Ln.LazyVStack.title)
                .font(.largeTitle)
            
            ScrollView {
                introductionBlock
                alignmentBlock
                scrollViewBlock
                pinnedViewsBlock
            }
        }
        .font(.title3)
        .background(Colors.background.asset.color)
    }
    
    private var introductionBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyVStack.introductionTitle,
                       desc: Ln.LazyVStack.introductionContext)
            .layoutPriority(1)
            
            Text(Ln.LazyVStack.introductionTextFirst)
            LazyVStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text(Ln.LazyVStack.introductionTextSecond)
            VStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text(Ln.LazyVStack.introductionNotice)
        }
    }
    
    private var alignmentBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyVStack.alignmentTitle,
                       desc: Ln.LazyVStack.alignmentContext)
            
            Text(Ln.LazyVStack.alignmentLeading)
            LazyVStack(alignment: .leading, spacing: 20) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text(Ln.LazyVStack.alignmentTrailing)
            LazyVStack(alignment: .trailing, spacing: 20) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
        }
    }
    
    private var scrollViewBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyVStack.scrollTitle,
                       desc: Ln.LazyVStack.scrollContext)
            if breedFetcher.isLoading {
                LoadingView()
            } else if breedFetcher.errorMessage != nil  {
                ErrorView(breedFetcher: breedFetcher)
            } else {
                ScrollView {
                    LazyVStack(spacing: 5) {
                        ForEach(breedFetcher.breeds.prefix(5)) { breed in
                            Section {
                                if breed.image?.url != nil {
                                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                                        if let image = phase.image {
                                            image.resizable()
                                                .scaledToFit()
                                                .frame( height: imageSize)
                                                .clipped()
                                        } else if phase.error != nil {
                                            Text(phase.error?.localizedDescription ?? "error")
                                                .foregroundColor(Color.pink)
                                                .frame(width: imageSize, height: imageSize)
                                        } else {
                                            ProgressView()
                                                .frame(width: imageSize, height: imageSize)
                                        }
                                        
                                    }
                                } else {
                                    Color.gray.frame(height: imageSize)
                                }
                            } header: {
                                BreedVerticalHeaderView(breed: breed)
                            } footer: {
                                BreedVerticalFooterView(breed: breed)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var pinnedViewsBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyVStack.pinnedTitle,
                       desc: Ln.LazyVStack.pinnedContext)
            ScrollView {
                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(breedFetcher.breeds.prefix(5)) { breed in
                        Section {
                            if breed.image?.url != nil {
                                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                                    if let image = phase.image {
                                        image.resizable()
                                            .scaledToFit()
                                            .frame( height: imageSize)
                                            .clipped()
                                    } else if phase.error != nil {
                                        Text(phase.error?.localizedDescription ?? "error")
                                            .foregroundColor(Color.pink)
                                            .frame(width: imageSize, height: imageSize)
                                    } else {
                                        ProgressView()
                                            .frame(width: imageSize, height: imageSize)
                                    }
                                    
                                }
                            } else {
                                Color.gray.frame(height: imageSize)
                            }
                        } header: {
                            BreedVerticalHeaderView(breed: breed)
                        } footer: {
                            BreedVerticalFooterView(breed: breed)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LazyVStackContentView(model: LazyVStackViewModelImpl(), breedFetcher: BreedFetcher(service: APIService()))
}
