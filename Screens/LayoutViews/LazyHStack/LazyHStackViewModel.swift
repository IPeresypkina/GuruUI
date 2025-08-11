import Foundation

protocol LazyHStackViewModel: ObservableObject {
    var isCodeVisible: Bool { get set }
    var codeOverlayViewModel: CodeOverlayViewModelImpl { get }
}

class LazyHStackViewModelImpl: LazyHStackViewModel {
    @Published var isCodeVisible = false
    
    var codeOverlayViewModel = CodeOverlayViewModelImpl()
}
