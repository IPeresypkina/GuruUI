import SwiftUI

struct CategoriesGridView: View {
    @ObservedObject var viewModel: BreedFetcher
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(ScreenType.allCases, id: \.self) { type in
                    NavigationLink(
                        destination: GenericScreenView(
                            viewModel: viewModel,
                            screenType: type)
                    ) {
                        VStack {
                            Image(systemName: type.imageName())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(type.imageColor())
                            Text(type.rawValue)
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
}
