import SwiftUI

struct MasteryViewItem: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}
