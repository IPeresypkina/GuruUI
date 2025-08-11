import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("😸")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the cats ...")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    LoadingView()
}
