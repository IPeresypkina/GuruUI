import Foundation

protocol GridViewModel: ObservableObject {
    var isCodeVisible: Bool { get set }
    var codeOverlayViewModel: CodeOverlayViewModelImpl { get }
}

class GridViewModelImpl: GridViewModel {
    @Published var isCodeVisible = false
    
    var codeOverlayViewModel = CodeOverlayViewModelImpl()
}
