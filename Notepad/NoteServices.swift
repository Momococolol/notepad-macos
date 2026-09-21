import Foundation

struct NoteSearchService {
    static func matches(_ note: Note, query: String) -> Bool { guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return true }; return [note.title, note.body, note.folder, note.tags.joined(separator: " ")].joined(separator: " ").localizedCaseInsensitiveContains(query) }
    static func score(_ note: Note, query: String) -> Int { let q=query.lowercased(); var score=0; if note.title.lowercased().hasPrefix(q){score += 100}; if note.title.lowercased().contains(q){score += 50}; if note.tags.joined().lowercased().contains(q){score += 25}; if note.body.lowercased().contains(q){score += 10}; return score }
}
struct NoteArchiveService {
    static func exportJSON(notes: [Note], to url: URL) throws { let e=JSONEncoder(); e.outputFormatting=[.prettyPrinted,.sortedKeys]; try e.encode(notes).write(to:url,options:.atomic) }
    static func importJSON(from url: URL) throws -> [Note] { try JSONDecoder().decode([Note].self, from: Data(contentsOf:url)) }
    static func exportMarkdown(_ note: Note, to url: URL) throws { let h="# \(note.title)\n\n> Folder: \(note.folder)\n> Tags: \(note.tags.joined(separator: ", "))\n\n"; try (h+note.body+"\n").write(to:url,atomically:true,encoding:.utf8) }
}
