import SwiftUI

public enum Colors {
    case background
    case blockBackground
    case firstText
    case secondText
    
    case blue
    case gray
    case green
    case lightBlue
    case orange
    case purple
    case white
    case yellow
    
    case codeBlockHead
    case codeBlockBody
    
    var asset: ColorAsset {
        switch self {
        case .background: return ColorAsset(name: "Background")
        case .blockBackground: return ColorAsset(name: "BlockBackground")
        case .firstText: return ColorAsset(name: "FirstText")
        case .secondText: return ColorAsset(name: "SecondText")
            
        case .blue: return ColorAsset(name: "Blue")
        case .gray: return ColorAsset(name: "Gray")
        case .green: return ColorAsset(name: "Green")
        case .lightBlue: return ColorAsset(name: "LightBlue")
        case .orange: return ColorAsset(name: "Orange")
        case .purple: return ColorAsset(name: "Purple")
        case .white: return ColorAsset(name: "White")
        case .yellow: return ColorAsset(name: "Yellow")
            
        case .codeBlockHead: return ColorAsset(name: "CodeBlockHead")
        case .codeBlockBody: return ColorAsset(name: "CodeBlockBody")
        }
    }
}

public class ColorAsset {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    lazy var color: Color = {
        return Color(name)
    }()
}
