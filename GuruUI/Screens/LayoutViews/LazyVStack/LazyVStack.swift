import SwiftUI

struct LazyVStackContentView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    
    let imageSize: CGFloat = 300
    
    var body: some View {
        VStack(spacing: 20) {
            Text("LazyVStack")
                .font(.largeTitle)
            ScrollView {
                introductionBlock
                alignmentBlock
                scrollViewBlock
                pinnedViewsBlock
            }
        }
        .font(.title)
    }
    
    private var introductionBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Introduction",
                       desc: "When using the LazyVStack by itself, you won't notice much of a difference from the VStack",
                       back: .yellow,
                       textColor: .black)
            .layoutPriority(1)
            
            Text("LazyVStack")
            LazyVStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("VStack")
            VStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Notice the LazyVStack pushes out horizontally. (No Spacers being used here.)")
        }
    }
    
    private var alignmentBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Alignment",
                       desc: "Since LazyVStacks are push-out views (horizontally) the alignment parameter could be useful.",
                       back: .yellow,
                       textColor: .black)
            
            Text("Leading")
            LazyVStack(alignment: .leading, spacing: 20) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Trailing")
            LazyVStack(alignment: .trailing, spacing: 20) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
        }
    }
    
    private var scrollViewBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "With ScrollView",
                       desc: "The LazyVStack is best used with many views that scroll off the screen. \"Lazy\" means views off the screen are not created unless shown. This increases performance.",
                       back: .yellow,
                       textColor: .black)
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
        VStack(spacing: 20) {
            HeaderView(subtitle: "Pinned Views",
                       desc: "LazyVStacks can also have section headers and section footers that can be pinned so they only scroll when the next header/footer comes.",
                       back: .yellow,
                       textColor: .black)
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
    LazyVStackContentView(breedFetcher: BreedFetcher(service: APIService()))
}
