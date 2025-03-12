import UIKit

internal enum Asset {
    internal static let logo = ImageAsset(name: "blueQ")
    
}

internal struct ImageAsset {
    internal fileprivate(set) var name: String
    internal var image: UIImage {
        let bundle = BundleToken.bundle
        let image = UIImage(named: name, in: bundle, compatibleWith: nil)
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }
}

private final class BundleToken {
    static let bundle: Bundle = {
        return Bundle(for: BundleToken.self)
    }()
}
