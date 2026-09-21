import SwiftUI

@main struct NotepadApp: App {
    @StateObject private var store = NoteStore()
    var body: some Scene { WindowGroup { ContentView().environmentObject(store).frame(minWidth: 980, minHeight: 620) }.commands { CommandGroup(replacing: .newItem) { Button("New Note") { store.add() }.keyboardShortcut("n", modifiers: .command) } } }
}
