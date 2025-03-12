import SwiftUI

struct GenericScreenView<ViewModel: ObservableObject>: View {
    @StateObject var viewModel: ViewModel
    @State private var viewScreens: [ScreenItem] = []
    var screenType: ScreenType
    
    var body: some View {
        List(viewScreens) { screen in
            NavigationLink(destination: screen.destination) {
                Text(screen.title)
                    .font(.headline)
                    .foregroundColor(Colors.firstText.asset.color)
                    .padding()
            }
            .listRowBackground(Colors.blockBackground.asset.color)
        }
        .navigationTitle(screenType.rawValue)
        .listStyle(DefaultListStyle())
        .font(.title)
        .background(Colors.background.asset.color)
        .scrollContentBackground(.hidden)
        .onAppear {
            viewScreens = screenType.destinationScreens(viewModel: viewModel)
        }
    }
}
