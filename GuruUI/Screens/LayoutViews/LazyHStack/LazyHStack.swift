import SwiftUI

struct LazyHStackContentView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    @State private var whatAppeared = ""
    
    let imageSize: CGFloat = 300
    
    var body: some View {
        VStack(spacing: 20) {
            Text("LazyHStack")
                .font(.largeTitle)
            ScrollView {
                introductionBlock
                alignmentBlock
                scrollViewBlock
                headersFootersBlock
                pinnedViewsBlock
            }
        }
        .font(.title)
    }
    
    private var introductionBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Introduction",
                       desc: "When using the LazyHStack by itself, you won't notice much of a difference from the HStack.",
                       back: .yellow,
                       textColor: .black)
            .layoutPriority(1)
            
            Text("LazyHStack")
            LazyHStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(.red, width: 2)
            
            Text("HStack")
            HStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(.red, width: 2)
            DescView(desc: "Notice the LazyHStack pushes out vertically. (No Spacers being used here.)",
                     back: .yellow,
                     textColor: .black)
        }
    }
    
    private var alignmentBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Alignment",
                       desc: "Since LazyHStacks are push-out views (vertically) the alignment parameter could be useful.",
                       back: .yellow,
                       textColor: .black)
            .layoutPriority(1)
            
            Text("Top")
            LazyHStack(alignment: .top, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .frame(height: 150)
            .border(.red, width: 2)
            
            Text("Bottom")
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
        VStack(spacing: 10.0) {
            HeaderView(subtitle: "With ScrollView",
                       desc: "The LazyHStack is best used with many views that scroll off the screen. \"Lazy\" means views off the screen are not created unless shown. This increases performance.",
                       back: .yellow,
                       textColor: .black)
            
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
        VStack(spacing: 10.0) {
            HeaderView(subtitle: "Headers & Footers",
                       desc: "Using the Section view, you can add a header and footer inside a LazyHStack.",
                       back: .yellow,
                       textColor: .black)
            
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
        VStack(spacing: 20) {
            HeaderView(subtitle: "Pinned Views",
                       desc: "LazyHStacks can also have section headers and section footers that can be pinned so they only scroll when the next header/footer comes.",
                       back: .yellow,
                       textColor: .black)
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
    LazyHStackContentView(breedFetcher: BreedFetcher(service: APIService()))
}
