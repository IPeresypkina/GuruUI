import SwiftUI

struct LazyHStackContentView<ViewModel: LazyHStackViewModel>: View {
    @StateObject var model: ViewModel
    @ObservedObject var breedFetcher: BreedFetcher
    @State private var whatAppeared = ""
    
    let imageSize: CGFloat = 300
    
    var body: some View {
        VStack(spacing: 10) {
            Text(Ln.LazyHStackScreen.title)
                .font(.largeTitle)
            
            ScrollView {
                introductionBlock
                alignmentBlock
                scrollViewBlock
                headersFootersBlock
                pinnedViewsBlock
            }
        }
        .font(.title3)
        .background(Colors.background.asset.color)
    }
    
    private var introductionBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyHStackScreen.introductionTitle,
                       desc: Ln.LazyHStackScreen.introductionContext)
            .layoutPriority(1)
            
            Text(Ln.LazyHStackScreen.introductionTextFirst)
            LazyHStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(.red, width: 2)
            
            Text(Ln.LazyHStackScreen.introductionTextSecond)
            HStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(.red, width: 2)
            DescView(desc: Ln.LazyHStackScreen.introductionNotice)
        }
    }
    
    private var alignmentBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyHStackScreen.alignmentTitle,
                       desc: Ln.LazyHStackScreen.alignmentContext)
            .layoutPriority(1)
            
            Text(Ln.LazyHStackScreen.alignmentTextFirst)
            LazyHStack(alignment: .top, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .frame(height: 150)
            .border(.red, width: 2)
            
            Text(Ln.LazyHStackScreen.alignmentTextSecond)
            LazyHStack(alignment: .bottom, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .frame(height: 150)
            .border(.red, width: 2)
        }
    }
    
    private var scrollViewBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyHStackScreen.scrollTitle,
                       desc: Ln.LazyHStackScreen.scrollContext)
            
            Spacer()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(0 ..< 51) { item in
                        Image(systemName: "\(item).circle")
                            .onAppear {
                                whatAppeared = "\(item).circle"
                            }
                    }
                }
                .font(.largeTitle)
                .padding()
            }
            
            Text("\(whatAppeared)")
        }
    }
    
    private var headersFootersBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyHStackScreen.headersFootersTitle,
                       desc: Ln.LazyHStackScreen.headersFootersContext)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 5) {
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
                        } 
//                    header: {
//                            TeamHeaderView(breed: breed)
//                        } footer: {
//                            TeamFooterView(count: 5)
//                        }
                    }
                }
            }
        }
    }
    
    private var pinnedViewsBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.LazyHStackScreen.pinnedTitle,
                       desc: Ln.LazyHStackScreen.pinnedContext)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 5, pinnedViews: [.sectionHeaders, .sectionFooters]) {
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
                        } 
//                    header: {
//                            TeamHeaderView(breed: breed)
//                        } footer: {
//                            TeamFooterView(count: 5)
//                        }
                    }
                }
            }
        }
    }
}

struct TeamHeaderView: View {
    var breed: Breed
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Breed: \(breed.name)")
                .font(.largeTitle)
                .lineLimit(nil) // Позволяет тексту занимать несколько строк
                .multilineTextAlignment(.leading) // Выравнивание текста
        }
        .frame(width: 75, height: 100)
        .background(Rectangle()
            .fill(Color.yellow)
            .opacity(0.9))
        .padding(.bottom, 8)
    }
}

struct TeamFooterView: View {
    var count: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Total")
                .font(.title2)
            Text("\(count)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(width: 60, height: 100)
        .background(Rectangle()
            .fill(Color.yellow)
            .opacity(0.9))
        .padding(.bottom, 8)
    }
}

#Preview {
    LazyHStackContentView(model: LazyHStackViewModelImpl(), breedFetcher: BreedFetcher(service: APIService()))
}
