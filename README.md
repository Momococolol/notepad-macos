# Notepad for macOS

A calm, native SwiftUI notes app for macOS. It is designed around fast capture, a clean sidebar, and rich visual covers.

## Features

- Create, edit, duplicate, delete, pin, archive, and restore notes
- Folders and tags with live counts
- Full-text search across titles, body, folders, and tags
- Markdown-style preview for headings, bold, italic, code, and links
- Autosave with a visible save status
- Cover picker with image, local video, and animated gradient covers
- Local persistence in `~/Library/Application Support/Notepad`
- Keyboard shortcuts: `⌘N` new note, `⌘F` search, `⌘⇧P` preview, `⌘⇧D` duplicate
- Native macOS layout with split navigation, editor, and inspector

## Run

Open `Notepad.xcodeproj` in Xcode and run the `Notepad` macOS target. Deployment target: macOS 13.0+.

The project is intentionally dependency-free and stores all note data locally as JSON. Images and videos are copied into the app's local media folder.

## GitHub

Create an empty GitHub repository, then run:

```bash
git remote add origin https://github.com/YOUR_NAME/notepad-macos.git
git push -u origin main
```
