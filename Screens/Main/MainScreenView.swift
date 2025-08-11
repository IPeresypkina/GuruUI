import SwiftUI

struct MainScreenView: View {
    @StateObject var breedFetcher = BreedFetcher()
    @State private var searchText = ""
    @State private var isSearching = false
    
    private var allSearchableItems: [ScreenItem] {
        ScreenType.allCases.flatMap { screenType in
            screenType.searchableItems(viewModel: breedFetcher)
        }
    }
    
    private var filteredItems: [ScreenItem] {
        guard !searchText.isEmpty else { return [] }
        return allSearchableItems.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.category?.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, isSearching: $isSearching)
                    .padding(.horizontal)
                
                if isSearching && !searchText.isEmpty {
                    SearchResultsView(items: filteredItems)
                } else {
                    CategoriesGridView(viewModel: breedFetcher)
                }
            }
            .navigationTitle(Ln.MasteryScreen.title)
            .background(Colors.background.asset.color)
        }
    }
}

#Preview {
    MainScreenView()
}
