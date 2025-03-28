import SwiftUI

struct ScreenItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let imageColor: Color
    let destination: AnyView
}

enum ScreenType: String, CaseIterable {
    case layoutViews = "Layout views"
    case controlViews = "Control views"
    case otherViews = "Other views"
    case paints = "Paints"
    case controlModifiers = "Controls modifiers"
    case layoutModifiers = "Layout modifiers"
    case effectModifiers = "Effect modifiers"
    case customStyling = "Custom styling"
    case imageModifiers = "Image modifiers"
    case gestures = "Gestures"
    case otherModifiers = "Other modifiers"
    case importingViews = "Importing views"
    case accessibility = "Accessibility"
    
    func imageName() -> String {
        switch self {
        case .layoutViews: return "square.grid.3x2.fill"
            case .controlViews: return "slider.horizontal.3"
            case .otherViews: return "ellipsis"
            case .paints: return "paintbrush.fill"
            case .controlModifiers: return "pencil.tip.crop.circle"
            case .layoutModifiers: return "rectangle.split.3x1"
            case .effectModifiers: return "sparkles"
            case .customStyling: return "paintpalette.fill"
            case .imageModifiers: return "photo.on.rectangle.angled"
            case .gestures: return "hand.tap"
            case .otherModifiers: return "gearshape.fill"
            case .importingViews: return "arrow.down.doc.fill"
            case .accessibility: return "accessibility"
        }
    }
    
    func imageColor() -> Color {
        switch self {
        case .layoutViews: return Colors.yellow.asset.color
        case .controlViews: return Colors.blue.asset.color
        case .otherViews: return Colors.gray.asset.color
        case .paints: return Colors.white.asset.color
        case .controlModifiers: return Colors.orange.asset.color
        case .layoutModifiers: return Colors.purple.asset.color
        case .effectModifiers: return Colors.green.asset.color
        case .customStyling: return Colors.white.asset.color
        case .imageModifiers: return Colors.orange.asset.color
        case .gestures: return Colors.lightBlue.asset.color
        case .otherModifiers: return Colors.gray.asset.color
        case .importingViews: return Colors.yellow.asset.color
        case .accessibility: return Colors.blue.asset.color
        }
    }
    
    func destinationScreens<ViewModel: ObservableObject>(viewModel: ViewModel) -> [ScreenItem] {
        switch self {
        case .layoutViews:
            return LayoutType.allCases.map { layoutType in
                ScreenItem(
                    title: layoutType.rawValue,
                    imageName: layoutType.imageName(),
                    imageColor: layoutType.imageColor(),
                    destination: layoutType.destinationView(breedFetcher: viewModel as! BreedFetcher)
                )
            }
        case .controlViews:
            // Аналогично для ControlType
            return []
        case .otherViews:
            return OtherType.allCases.map { otherType in
                ScreenItem(
                    title: otherType.rawValue,
                    imageName: otherType.imageName(),
                    imageColor: otherType.imageColor(),
                    destination: otherType.destinationView()
                )
            }
        default:
            return []
        }
    }
}

enum LayoutType: String, CaseIterable {
    case vStack = "VStack"
    case lazyVStack = "LazyVStack"
    case hStack = "HStack"
    case lazyHStack = "LazyHStack"
    case grid = "Grid"
    
    func imageName() -> String {
        return "star.fill"
    }
        
    func imageColor() -> Color {
        return .blue
    }
    
    func destinationView(breedFetcher: BreedFetcher) -> AnyView {
        switch self {
        case .vStack: return AnyView(VStackContentView(model: VStackContentViewModelImpl()))
        case .lazyVStack: return AnyView(LazyVStackContentView(breedFetcher: breedFetcher))
        case .hStack: return AnyView(HStackContentView())
        case .lazyHStack: return AnyView(LazyHStackContentView(breedFetcher: breedFetcher))
        case .grid: return AnyView(GridContentView())
        }
    }
}

enum OtherType: String, CaseIterable {
    case canvas = "Canvas"
    
    func imageName() -> String {
        return "star.fill"
    }
        
    func imageColor() -> Color {
        return .blue
    }
    
    func destinationView() -> AnyView {
        switch self {
        case .canvas: return AnyView(CanvasView())
        }
    }
}
