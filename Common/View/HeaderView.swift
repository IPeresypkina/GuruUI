import SwiftUI

struct HeaderView: View {
    var title: String?
    var subtitle: String
    var desc: String
    var back: Color
    var textColor: Color
    
    init(_ title: String? = nil, subtitle: String, desc: String, back: Color = Colors.blockBackground.asset.color, textColor: Color = Colors.firstText.asset.color) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            if let title = title {
                Text(title)
                    .font(.largeTitle)
            }
            
            Text(subtitle)
                .font(.title)
                .foregroundColor(.gray)
            
            Text(desc)
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundColor(textColor)
                .padding()
                .background(back)
        }
    }
}

#Preview {
    HeaderView("Title", subtitle: "Subtitle", desc: "Description", back: Colors.blockBackground.asset.color, textColor: Colors.firstText.asset.color)
}
