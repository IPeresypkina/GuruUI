import SwiftUI

struct DescView: View {
    var desc: String
    var back: Color
    var textColor: Color
    
    init(desc: String, back: Color = Colors.blockBackground.asset.color, textColor: Color = Colors.firstText.asset.color) {
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .foregroundColor(textColor)
            .background(back)
    }
}

#Preview {
    DescView(desc: "Description", back: Colors.blockBackground.asset.color, textColor: Colors.firstText.asset.color)
}
