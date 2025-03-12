import SwiftUI

struct OverlayMessageView: View {
    let message: String
    let image: Image?
    
    @Binding var isVisible: Bool
    
    var body: some View {
        if isVisible {
            VStack {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                }
                Text(message)
                    .font(.headline)
                    .padding()
            }
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
            .foregroundColor(.white)
            .shadow(radius: 10)
            .frame(width: 200, height: 100)
            .transition(.scale)
            .animation(.easeInOut)
            .padding()
//            .hidden()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        isVisible = false
                    }
                }
            }
        }
    }
}
