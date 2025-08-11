import SwiftUI

struct ZStackView<ViewModel: ZStackViewModel>: View {
    @StateObject var model: ViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(Ln.ZStack.title)
        }
    }
}
