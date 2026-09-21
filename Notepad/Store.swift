import SwiftUI

@MainActor final class NoteStore: ObservableObject {
    @Published var notes: [Note] = [] { didSet { save() } }
    @Published var filter: NoteFilter = .all; @Published var query = ""; @Published var selectedID: UUID?
    private let url: URL
    init() { let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent("Notepad", isDirectory: true); try? FileManager.default.createDirectory(at: base, withIntermediateDirectories: true); url = base.appendingPathComponent("notes.json"); load(); if notes.isEmpty { notes = [Note(title: "Welcome to Notepad", body: "# Make space for good ideas\n\nThis is your quiet place to think, write, and collect things. Add a note with **⌘N**.", folder: "Getting Started", tags: ["welcome"], cover: .gradient(1), isPinned: true)] }; selectedID = notes.first?.id }
    var selected: Note? { notes.first(where: {$0.id == selectedID}) }
    var folders: [String] { Array(Set(notes.map(\.folder))).sorted() }
    var tags: [String] { Array(Set(notes.flatMap(\.tags))).sorted() }
    var filtered: [Note] { notes.filter { n in let matches: Bool; switch filter { case .all: matches = !n.isArchived; case .pinned: matches = n.isPinned && !n.isArchived; case .archive: matches = n.isArchived; case .folder(let f): matches = n.folder == f && !n.isArchived; case .tag(let t): matches = n.tags.contains(t) && !n.isArchived }; return matches && (query.isEmpty || [n.title,n.body,n.folder,n.tags.joined()].joined(separator: " ").localizedCaseInsensitiveContains(query)) }.sorted { $0.isPinned && !$1.isPinned || $0.updatedAt > $1.updatedAt } }
    func add() { let n = Note(); notes.insert(n, at: 0); selectedID = n.id }
    func update(_ n: Note) { if let i = notes.firstIndex(where: {$0.id == n.id}) { notes[i] = n } }
    func delete(_ n: Note) { notes.removeAll { $0.id == n.id }; selectedID = filtered.first?.id }
    func duplicate(_ n: Note) { var copy = n; copy.id = UUID(); copy.title += " Copy"; copy.updatedAt = Date(); notes.insert(copy, at: 0); selectedID = copy.id }
    private func load() { if let data = try? Data(contentsOf: url), let value = try? JSONDecoder().decode([Note].self, from: data) { notes = value } }
    private func save() { if let data = try? JSONEncoder().encode(notes) { try? data.write(to: url, options: .atomic) } }
}
