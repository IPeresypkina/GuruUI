import SwiftUI

struct VStackContentView<ViewModel: VStackContentViewModel>: View {
    @StateObject var model: ViewModel
    
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
        .sheet(isPresented: $model.isCodeVisible) {
            CodeOverlayView(
                model: model.codeOverlayViewModel,
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
//                    model.showCodeExample(model.codeExamples[0])
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
//                    model.showCodeExample(model.codeExamples[1])
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
    VStackContentView(model: VStackContentViewModelImpl())
}
