import Foundation

protocol VStackContentViewModel: ObservableObject {
//    var codeExamples: [CodeExample] { get set }
    var isCodeVisible: Bool { get set }
    var codeOverlayViewModel: CodeOverlayViewModelImpl { get }
    
//    func showCodeExample(_ example: CodeExample)
}

//class VStackContentViewModelPreview: VStackContentViewModel {
//    
//}

class VStackContentViewModelImpl: VStackContentViewModel {
//    @Published var codeExamples: [CodeExample] = []
    @Published var isCodeVisible = false
    
    var codeOverlayViewModel = CodeOverlayViewModelImpl()
//    
//    private let coreDataManager: CoreDataManager
//    
//    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
//        self.coreDataManager = coreDataManager
//        
//        loadCodeExamples()
//    }
    
//    private func loadCodeExamples() {
//        codeExamples = coreDataManager.fetch(CodeExample.self, predicate: NSPredicate(format: "topic == %@", "VStack"))
//    }
//    
//    func showCodeExample(_ example: CodeExample) {
//        codeOverlayViewModel.updateCodeExample(example.code ?? "")
//        isCodeVisible = true
//    }
}
