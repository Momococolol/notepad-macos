import SwiftUI

@main struct NotepadApp: App {
    @StateObject private var store = NoteStore()
    @StateObject private var settings = AppSettings()
    var body: some Scene { WindowGroup { ContentView().environmentObject(store).environmentObject(settings).frame(minWidth:980,minHeight:620).tint(settings.color).preferredColorScheme(settings.appearance == "dark" ? .dark : settings.appearance == "light" ? .light : nil) }.commands { CommandGroup(replacing:.newItem) { Button("New Note") { store.add() }.keyboardShortcut("n",modifiers:.command); Button("Duplicate Note") { if let n=store.selected { store.duplicate(n) } }.keyboardShortcut("d",modifiers:[.command,.shift]) } }; Settings { SettingsView().environmentObject(settings) } }
}
