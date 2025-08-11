import Foundation

protocol HStackViewModel: ObservableObject {
    var isCodeVisible: Bool { get set }
    var codeOverlayViewModel: CodeOverlayViewModelImpl { get }
}

class HStackViewModelImpl: HStackViewModel {
    @Published var isCodeVisible = false
    
    var codeOverlayViewModel = CodeOverlayViewModelImpl()
}
