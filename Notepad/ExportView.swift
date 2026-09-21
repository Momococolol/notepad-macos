import SwiftUI
import AppKit
struct ExportView: View { @EnvironmentObject var store: NoteStore; @State private var message=""; var body: some View { Form { Section("Backup") { Button("Export all notes as JSON") { exportAll() }; Button("Import JSON backup…") { importAll() } }; Section("Selected note") { Button("Export as Markdown…") { exportMarkdown() } }; if !message.isEmpty { Text(message).foregroundStyle(.secondary) } }.padding().frame(width:420,height:230) }
    private func exportAll(){let p=NSSavePanel();p.nameFieldStringValue="Notepad2-backup.json";p.runModal();if let u=p.url{try? NoteArchiveService.exportJSON(notes:store.notes,to:u);message="Backup exported."}}
    private func importAll(){let p=NSOpenPanel();p.runModal();if let u=p.url{do{store.notes.append(contentsOf:try NoteArchiveService.importJSON(from:u));message="Backup imported."}catch{message="Could not import that file."}}}
    private func exportMarkdown(){guard let n=store.selected else{return};let p=NSSavePanel();p.nameFieldStringValue=n.title+".md";p.runModal();if let u=p.url{try? NoteArchiveService.exportMarkdown(n,to:u);message="Markdown exported."}}
}
