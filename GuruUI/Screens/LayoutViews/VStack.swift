import SwiftUI

struct VStackContentView: View {
    @State private var isCodeVisible = false
    @StateObject private var codeOverlayViewModel = CodeOverlayViewModelImpl()
    
    var body: some View {
        VStack(spacing: 10) {
            Text(Ln.VStackScreen.title)
                .font(.largeTitle)
            
            ScrollView {
                nestingBlock
                alignmentBlock
            }
        }
        .font(.title3)
        .background(Colors.background.asset.color)
        
        .sheet(isPresented: $isCodeVisible) {
            CodeOverlayView(
                model: codeOverlayViewModel,
                parentViewController: UIApplication.shared.windows.first?.rootViewController
            )
        }
    }
    
    private var nestingBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.VStackScreen.introductionTitle.lowercased(),
                       desc: Ln.VStackScreen.introductionContext)
            
            Button("Show Code") {
                withAnimation {
                    codeOverlayViewModel.updateCodeExample(Ln.VStackScreen.introductionExample)
                    isCodeVisible = true
                }
            }
            
            VStack {
                Text(Ln.VStackScreen.introductionTextFirst)
                Divider()
                Text(Ln.VStackScreen.introductionTextSecond)
                Divider()
                Text(Ln.VStackScreen.introductionTextThird)
            }
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Colors.blockBackground.asset.color)
            )
            .padding()
        }
    }
    
    private var alignmentBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.VStackScreen.nestingTitle,
                       desc: Ln.VStackScreen.nestingContext)
            Button("Show Code") {
                withAnimation {
                    codeOverlayViewModel.updateCodeExample(Ln.VStackScreen.nestingExample)
                    isCodeVisible = true
                }
            }
            VStack(alignment: .leading, spacing: 20) {
                Text( Ln.VStackScreen.nestingTextFirst)
                    .font(.title)
                Divider()
                Image(systemName: "arrow.left")
            }
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Colors.blockBackground.asset.color)
            )
            .padding()
            
            VStack(alignment: .trailing, spacing: 20) {
                Text( Ln.VStackScreen.nestingTextSecond)
                    .font(.title)
                Divider()
                Image(systemName: "arrow.right")
            }
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Colors.blockBackground.asset.color)
            )
            .padding()
        }
    }
}

#Preview {
    VStackContentView()
}
