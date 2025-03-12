import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        VStack {
            Text("😿")
                .font(.system(size: 80))
            
            Text(breedFetcher.errorMessage ?? "")
            
            Button {
                breedFetcher.fetchAllBreeds()
            } label: {
                Text("Try again")
            }
        }
    }
}

#Preview {
    ErrorView(breedFetcher: BreedFetcher())
}
