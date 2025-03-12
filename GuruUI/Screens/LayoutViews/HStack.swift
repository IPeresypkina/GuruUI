import SwiftUI

struct HStackContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
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
        .font(.title)
    }
    
    private var introductionBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Introduction",
                       desc: "An HStack will horizontally arrange other views within it.",
                       back: .orange,
                       textColor: .black)
            HStack {
                Text("View 1")
                Text("View 2")
                Text("View 3")
            }
        }
    }
    
    private var spacingBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Spacing",
                       desc: "The HStack initializer allows you to set the spacing between all the views inside the HStack.",
                       back: .orange,
                       textColor: .black)
            Text("Default Spacing")
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .font(.largeTitle)
            
            Text("Spacing: 100")
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
        VStack(spacing: 20) {
            HeaderView(subtitle: "Vertical Alignment",
                       desc: "By default, views within an HStack are vertically aligned in the center.",
                       back: .orange,
                       textColor: .black)
            HStack {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .frame(height: 150)
            .border(.orange)
            HStack(alignment: .top) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Top")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .frame(height: 150)
            .border(.orange)
            HStack(alignment: .bottom) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Bottom")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .frame(height: 150)
            .border(.orange)
        }
    }
    
    private var textAlignmentBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Text Alignment",
                       desc: "HStacks have another alignment option to help better align the bottom of text.",
                       back: .orange,
                       textColor: .black)
            HStack(alignment: .bottom) {
                Text("Hello")
                Text("amazing")
                    .font(.largeTitle)
                Text("developer!")
            }
            .font(.body)
            DescView(desc: "Notice the bottom of the text isn't really aligned above. Use firstTextBaseline or lastTextBaseline instead:", 
                     back: .orange,
                     textColor: .black)
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                Text("amazing")
                    .font(.largeTitle)
                Text("developer!")
            }
            .font(.body)
        }
    }
    
    private var textAlignmentFirstLast: some View {
        VStack {
            HeaderView(subtitle: "First & Last Text Alignment",
                       desc: "The firstTextBaseline will align the bottom of the text on the first lines (\"Amazing\" and \"Really\").",
                       back: .orange,
                       textColor: .black)
            HStack(alignment: .firstTextBaseline) {
                Text("Amazing developer")
                    .font(.title3)
                Text("Really amazing developer")
            }
            .frame(width: 250)
            
            DescView(desc: "The lastTextBaseline will align the bottom of the text on the last lines (\"developer\" and \"developer\").",
                     back: .orange,
                     textColor: .black)
                     
            HStack(alignment: .lastTextBaseline) {
                Text("Amazing developer")
                    .font(.title3)
                Text("Really amazing developer")
            }
            .frame(width: 250)
            
        }
    }
    
    private var customizingBlock: some View {
        VStack(spacing: 20) {
            HeaderView(subtitle: "Customizing",
                       desc: "HStacks are views that can have modifiers applied to them just like any other view.",
                       back: .orange,
                       textColor: .black)
            HStack {
                Text("Leading")
                Text("Middle")
                Text("Trailing")
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
        VStack(spacing: 20) {
            HeaderView(subtitle: "Layout Priority",
                       desc: "Use the layoutPriority modifier to give priority to the space a view needs to show its content.",
                       back: .orange,
                       textColor: .black)
            Text(".layoutPriority(1) is set on 'Brings Balance'")
                .font(.title3)
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .lineLimit(1)
                Text("🐱")
                    .font(.system(size: 70))
                Text("Brings Balance")
                    .font(.largeTitle)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            Divider()
            HStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .layoutPriority(1)
                Text("🐱")
                    .font(.system(size: 70))
                Text("Brings Balance")
                    .font(.largeTitle)
                    .lineLimit(1)
            }
            .padding(.horizontal)
            Text(".layoutPriority(1) is set on 'SwiftUI'")
                .font(.title3)
        }
    }
}

#Preview {
    HStackContentView()
}
