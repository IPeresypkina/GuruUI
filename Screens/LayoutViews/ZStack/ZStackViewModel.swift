import Foundation

protocol ZStackViewModel: ObservableObject {
    var isCodeVisible: Bool { get set }
    var codeOverlayViewModel: CodeOverlayViewModelImpl { get }
}

final class ZStackViewModelImpl: ZStackViewModel {
    @Published var isCodeVisible = false
    
    var codeOverlayViewModel = CodeOverlayViewModelImpl()
}
