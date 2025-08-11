import SwiftUI

struct HStackContentView<ViewModel: HStackViewModel>: View {
    @StateObject var model: ViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(Ln.HStack.title)
                .font(.largeTitle)
            
            ScrollView {
                introductionBlock
                spacingBlock
                verticalAlignmentBlock
                textAlignmentBlock
                textAlignmentFirstLast
                customizingBlock
                layoutPriorityBlock
            }
        }
        .font(.title3)
        .background(Colors.background.asset.color)
    }
    
    private var introductionBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.introductionTitle,
                       desc: Ln.HStack.introductionContext)
            HStack {
                Text(Ln.HStack.introductionTextFirst)
                Text(Ln.HStack.introductionTextSecond)
                Text(Ln.HStack.introductionTextThird)
            }
        }
    }
    
    private var spacingBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.spacingTitle,
                       desc: Ln.HStack.spacingContext)
            Text(Ln.HStack.spacingTextFirst)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .font(.largeTitle)
            
            Text(Ln.HStack.spacingTextSecond)
                .font(.title)
            HStack(spacing: 100) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .font(.largeTitle)
        }
    }
    
    private var verticalAlignmentBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.verticalAlignmentTitle,
                       desc: Ln.HStack.verticalAlignmentContext)
            HStack {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text(Ln.HStack.verticalAlignmentExampleLeading)
                Spacer()
                Text(Ln.HStack.verticalAlignmentExampleCenter)
                Spacer()
                Text(Ln.HStack.verticalAlignmentExampleTrailing)
                    .padding(.trailing)
            }
            .frame(height: 150)
            .border(.orange)
            HStack(alignment: .top) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text(Ln.HStack.verticalAlignmentExampleLeading)
                Spacer()
                Text(Ln.HStack.verticalAlignmentExampleTop)
                Spacer()
                Text(Ln.HStack.verticalAlignmentExampleTrailing)
                    .padding(.trailing)
            }
            .frame(height: 150)
            .border(.orange)
            HStack(alignment: .bottom) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text(Ln.HStack.verticalAlignmentExampleLeading)
                Spacer()
                Text(Ln.HStack.verticalAlignmentExampleBottom)
                Spacer()
                Text(Ln.HStack.verticalAlignmentExampleTrailing)
                    .padding(.trailing)
            }
            .frame(height: 150)
            .border(.orange)
        }
    }
    
    private var textAlignmentBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.textAlignmentTitle,
                       desc: Ln.HStack.textAlignmentContext)
            HStack(alignment: .bottom) {
                Text(Ln.HStack.textAlignmentTextFirst)
                Text(Ln.HStack.textAlignmentTextSecond)
                    .font(.largeTitle)
                Text(Ln.HStack.textAlignmentTextThird)
            }
            .font(.body)
            DescView(desc: Ln.HStack.textAlignmentNotice)
            HStack(alignment: .firstTextBaseline) {
                Text(Ln.HStack.textAlignmentTextFirst)
                Text(Ln.HStack.textAlignmentTextSecond)
                    .font(.largeTitle)
                Text(Ln.HStack.textAlignmentTextThird)
            }
            .font(.body)
        }
    }
    
    private var textAlignmentFirstLast: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.textAlignmentFirstLastTitle,
                       desc: Ln.HStack.textAlignmentFirstLastContext)
            HStack(alignment: .firstTextBaseline) {
                Text(Ln.HStack.textAlignmentFirstLastTextFirst)
                    .font(.title3)
                Text(Ln.HStack.textAlignmentFirstLastTextSecond)
            }
            .frame(width: 250)
            
            DescView(desc: Ln.HStack.textAlignmentFirstLastNotice)
                     
            HStack(alignment: .lastTextBaseline) {
                Text(Ln.HStack.textAlignmentFirstLastTextFirst)
                    .font(.title3)
                Text(Ln.HStack.textAlignmentFirstLastTextSecond)
            }
            .frame(width: 250)
            
        }
    }
    
    private var customizingBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.customizingTitle,
                       desc: Ln.HStack.customizingContext)
            HStack {
                Text(Ln.HStack.customizingTextFirst)
                Text(Ln.HStack.customizingTextSecond)
                Text(Ln.HStack.customizingTextThird)
            }
            .padding()
            .border(.orange)
            
            HStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .padding()
            
            HStack(spacing: 20) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "c.circle.fill")
                Image(systemName: "d.circle.fill")
                Image(systemName: "e.circle.fill")
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
            )
        }
    }
    
    var layoutPriorityBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.HStack.layoutPriorityTitle,
                       desc: Ln.HStack.layoutPriorityContext)
            Text(Ln.HStack.layoutPriorityNoticeFirst)
                .font(.title3)
            HStack {
                Text(Ln.HStack.layoutPriorityTextFirst)
                    .font(.largeTitle)
                    .lineLimit(1)
                Text(Ln.HStack.layoutPriorityTextSecond)
                    .font(.system(size: 70))
                Text(Ln.HStack.layoutPriorityTextThird)
                    .font(.largeTitle)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            Divider()
            HStack {
                Text(Ln.HStack.layoutPriorityTextFirst)
                    .font(.largeTitle)
                    .layoutPriority(1)
                Text(Ln.HStack.layoutPriorityTextSecond)
                    .font(.system(size: 70))
                Text(Ln.HStack.layoutPriorityTextThird)
                    .font(.largeTitle)
                    .lineLimit(1)
            }
            .padding(.horizontal)
            Text(Ln.HStack.layoutPriorityNoticeSecond)
                .font(.title3)
        }
    }
}

#Preview {
    HStackContentView(model: HStackViewModelImpl())
}
