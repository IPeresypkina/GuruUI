import SwiftUI
import Highlightr

struct CodeOverlayView<ViewModel: CodeOverlayViewModel>: View {
    @StateObject var model: ViewModel
    @State private var showOverlay = false
    
    weak var parentViewController: UIViewController?
    
    var body: some View {
        VStack {
            HStack {
                Text("swift code")
                Spacer()
                Button(action: {
                    model.copyCode()
                    showOverlay = true
                }) {
                    Image(systemName: "document.on.document")
                }
                Button(action: {
                    if let parentVC = parentViewController {
                        model.shareCode(from: parentVC)
                    }
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .foregroundColor(Colors.firstText.asset.color)
            .padding()
            
            ScrollView {
                if let attributedCode = model.highlightedCode() {
                    AttributedText(attributedString: attributedCode)
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text(model.codeExample)
                        .padding()
                }
            }
            .background(Colors.codeBlockBody.asset.color)
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
        }
        .font(.headline)
        .background(Colors.codeBlockHead.asset.color)
        .cornerRadius(20)
        
        .overlay(
            OverlayMessageView(message: "Скопировано", image: Image(systemName: "checkmark.circle"), isVisible: $showOverlay)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            )
    }
}

#Preview {
    CodeOverlayView(model: CodeOverlayViewModelPreview(
        codeExample:
            """
                struct ContentView: View {
                    var body: some View {
                        VStack {
                            Text("Hello, World!")
                        }
                    }
                }
                """
    ))
}
