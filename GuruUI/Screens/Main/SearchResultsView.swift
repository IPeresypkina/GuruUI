import SwiftUI

struct SearchResultsView: View {
    let items: [ScreenItem]
    
    var body: some View {
        List(items) { item in
            NavigationLink(destination: item.destination) {
                HStack {
                    Image(systemName: item.imageName)
                        .foregroundColor(item.imageColor)
                    VStack(alignment: .leading) {
                        Text(item.title)
                        if let category = item.category {
                            Text(category)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listRowBackground(Colors.blockBackground.asset.color)
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
        .overlay(
            items.isEmpty ? Text("No results found").foregroundColor(.gray) : nil
        )
    }
}
