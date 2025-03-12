import Foundation

internal enum Ln {
    internal static let common = Ln.tr("Localizable", "COMMON")
    
    internal enum MasteryScreen {
        internal static let title = Ln.tr("Localizable", "MasteryMenuScreen.title")
    }
    
    internal enum LayoutViewScreen {
        internal static let title = Ln.tr("Localizable", "LayoutViewScreen.title")
    }
    
    internal enum VStackScreen {
        internal static let title = Ln.tr("Localizable", "VStackViewScreen.title")
        
        internal static let introductionTitle = Ln.tr("Localizable", "VStackViewScreen.introduction.title")
        internal static let introductionContext = Ln.tr("Localizable", "VStackViewScreen.introduction.context")
        internal static let introductionTextFirst = Ln.tr("Localizable", "VStackViewScreen.introduction.text.first")
        internal static let introductionTextSecond = Ln.tr("Localizable", "VStackViewScreen.introduction.text.second")
        internal static let introductionTextThird = Ln.tr("Localizable", "VStackViewScreen.introduction.text.third")
        internal static let introductionExample = Ln.tr("Localizable", "VStackViewScreen.introduction.example")
        
        internal static let nestingTitle = Ln.tr("Localizable", "VStackViewScreen.nesting.title")
        internal static let nestingContext = Ln.tr("Localizable", "VStackViewScreen.nesting.context")
        internal static let nestingTextFirst = Ln.tr("Localizable", "VStackViewScreen.nesting.text.first")
        internal static let nestingTextSecond = Ln.tr("Localizable", "VStackViewScreen.nesting.text.second")
        internal static let nestingExample = Ln.tr("Localizable", "VStackViewScreen.nesting.example")
    }
}

// MARK: - Implementation Details
extension Ln {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {
    static let bundle: Bundle = {
        return Bundle(for: BundleToken.self)
    }()
}
