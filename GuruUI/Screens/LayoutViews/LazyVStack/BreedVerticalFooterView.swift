import SwiftUI

struct BreedVerticalFooterView: View {
    var breed: Breed
    
    var body: some View {
        HStack {
            Text("Temperament: ")
                .font(.title)
            Text("\(breed.temperament)")
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity, minHeight: 50)
        .padding()
        .background(Rectangle()
            .fill(Color.yellow)
            .opacity(0.9))
    }
}
