import SwiftUI

struct MainScreenView: View {
    @StateObject var breedFetcher = BreedFetcher()
    @State private var viewScreens: [ScreenItem] = []
        
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewScreens) { screen in
                            NavigationLink(destination: screen.destination) {
                                VStack {
                                    Image(systemName: screen.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(screen.imageColor)
                                    Text(screen.title)
                                        .font(.headline)
                                        .foregroundColor(Colors.firstText.asset.color)
                                }
                                .frame(minWidth: 70, minHeight: 100)
                                .padding()
                                .background(Colors.blockBackground.asset.color)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationTitle(Ln.MasteryScreen.title)
            .background(Colors.background.asset.color)
            .onAppear {
                viewScreens = ScreenType.allCases.map { screenType in
                    ScreenItem(
                        title: screenType.rawValue,
                        imageName: screenType.imageName(),
                        imageColor: screenType.imageColor(),
                        destination: AnyView(GenericScreenView(viewModel: breedFetcher, screenType: screenType))
                    )
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}
