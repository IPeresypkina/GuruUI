import SwiftUI
import Highlightr

protocol CodeOverlayViewModel: ObservableObject {
    var codeExample: String { get }
    
    func copyCode()
    func shareCode(from viewController: UIViewController)
    func highlightedCode() -> NSAttributedString?
}

class CodeOverlayViewModelPreview: CodeOverlayViewModel {
    var codeExample: String
    
    init(codeExample: String) {
        self.codeExample = codeExample
    }
    
    func copyCode() {}
    func shareCode(from viewController: UIViewController) {}
    func highlightedCode() -> NSAttributedString? { return nil }
}


class CodeOverlayViewModelImpl: CodeOverlayViewModel {
    @Published var codeExample: String = ""
    
    private let highlightr = Highlightr()
    
    init() {
        highlightr?.setTheme(to: "rainbow")
    }
    
    func updateCodeExample(_ newCode: String) {
        self.codeExample = newCode
    }
    
    func copyCode() {
        UIPasteboard.general.string = codeExample
        print("Код скопирован в буфер обмена: \(codeExample)")
    }
    
    func shareCode(from viewController: UIViewController) {
        let fileManager = FileManager.default
        let temporaryDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let fileUrl = temporaryDirectory.appendingPathComponent("code").appendingPathExtension("txt")
        
        if let data = codeExample.data(using: .utf8) {
            do {
                try data.write(to: fileUrl)
                print("Successfully wrote to file!")
            } catch {
                print("Error writing to file: \(error)")
            }
        }
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            let activityVC = UIActivityViewController(activityItems: [fileUrl], applicationActivities: nil)
            activityVC.completionWithItemsHandler = { _, _, _, _ in
                // Удаляем файл после использования
                try? FileManager.default.removeItem(at: fileUrl)
            }
            viewController.present(activityVC, animated: true, completion: nil)
        } else {
            print("Файл не создан: \(fileUrl.path)")
        }
        
//        let activityVC = UIActivityViewController(activityItems: [codeExample], applicationActivities: nil)
//        viewController.present(activityVC, animated: true, completion: nil)
    }
    
    func highlightedCode() -> NSAttributedString? {
        guard !codeExample.isEmpty else { return nil }
        return highlightr?.highlight(codeExample, as: "swift")
    }
    
}
