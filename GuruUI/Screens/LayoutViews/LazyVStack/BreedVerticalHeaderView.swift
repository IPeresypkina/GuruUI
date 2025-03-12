import SwiftUI

struct BreedVerticalHeaderView: View {
    var breed: Breed
    
    var body: some View {
        HStack {
            Text("Breed: \(breed.name)")
                .font(.largeTitle)
                .lineLimit(nil) // Позволяет тексту занимать несколько строк
                .multilineTextAlignment(.leading) // Выравнивание текста
        }
        .frame(maxWidth: .infinity, minHeight: 75)
        .padding()
        .background(Rectangle()
            .fill(Color.yellow)
            .opacity(0.9))
    }
}
