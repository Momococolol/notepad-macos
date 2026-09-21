import Foundation

enum Cover: Codable, Equatable { case none, gradient(Int), image(String), video(String) }
struct Note: Identifiable, Codable, Equatable {
    var id = UUID(); var title = "Untitled Note"; var body = ""; var folder = "Personal"; var tags: [String] = []
    var cover: Cover = .gradient(0); var isPinned = false; var isArchived = false
    var createdAt = Date(); var updatedAt = Date()
}
enum NoteFilter: Hashable { case all, pinned, archive, folder(String), tag(String) }
