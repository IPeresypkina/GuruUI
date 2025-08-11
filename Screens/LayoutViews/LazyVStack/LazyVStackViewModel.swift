import Foundation

protocol LazyVStackViewModel: ObservableObject {
    var isCodeVisible: Bool { get set }
    var codeOverlayViewModel: CodeOverlayViewModelImpl { get }
}

class LazyVStackViewModelImpl: LazyVStackViewModel {
    @Published var isCodeVisible = false
    
    var codeOverlayViewModel = CodeOverlayViewModelImpl()
}
