import Foundation
import SwiftUI

@MainActor final class AppSettings: ObservableObject {
    @AppStorage("appearance") var appearance = "system"
    @AppStorage("autosave") var autosave = true
    @AppStorage("showWordCount") var showWordCount = true
    @AppStorage("editorFontSize") var editorFontSize = 16.0
    @AppStorage("accentColor") var accentColor = "indigo"
    var color: Color { switch accentColor { case "blue": return .blue; case "purple": return .purple; case "orange": return .orange; case "green": return .green; default: return .indigo } }
}
enum AppAppearance: String, CaseIterable, Identifiable { case system, light, dark; var id: Self { self }; var title: String { rawValue.capitalized } }
