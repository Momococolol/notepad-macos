import SwiftUI
struct MarkdownRenderer: View {
    let source: String
    var body: some View { VStack(alignment:.leading,spacing:12) { ForEach(Array(source.split(separator:"\n",omittingEmptySubsequences:false).enumerated()),id:\.offset) { _,line in lineView(String(line)) } }.textSelection(.enabled) }
    @ViewBuilder private func lineView(_ line:String) -> some View { if line.hasPrefix("### ") { Text(String(line.dropFirst(4))).font(.title3.bold()) } else if line.hasPrefix("## ") { Text(String(line.dropFirst(3))).font(.title2.bold()) } else if line.hasPrefix("# ") { Text(String(line.dropFirst(2))).font(.largeTitle.bold()) } else if line.hasPrefix("- ") { Label(String(line.dropFirst(2)),systemImage:"circle.fill") } else if line.hasPrefix("> ") { Text(String(line.dropFirst(2))).italic().foregroundStyle(.secondary).padding(.leading,12) } else if line.isEmpty { Color.clear.frame(height:4) } else { Text(LocalizedStringKey(line)) } }
}
