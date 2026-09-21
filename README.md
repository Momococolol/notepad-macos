# Notepad2 for macOS

A modern native SwiftUI notes app for macOS. Notepad2 is designed around fast capture, a clean sidebar, rich visual covers, and local-first ownership of your writing.

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
- Settings window for appearance, accent color, autosave, and editor sizing
- JSON backup/restore and Markdown export from the main toolbar

## Run

Open `Notepad.xcodeproj` in Xcode and run the `Notepad` macOS target. Deployment target: macOS 13.0+.

To make a launchable app and installer DMG after installing Xcode, run `./scripts/build-dmg.sh`. The DMG uses the standard drag-to-Applications layout.

## Apple signing and certification

The project is prepared for automatic signing, but certification cannot be embedded without the owner's Apple Developer account. In Xcode, select the `Notepad` target, choose your Team, enable Hardened Runtime, and use a Developer ID Application certificate for distribution outside the Mac App Store. Then notarize the DMG with Apple's `notarytool` and staple the ticket. Apple documents this workflow at https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution.

The project is intentionally dependency-free and stores all note data locally as JSON. Images and videos are copied into the app's local media folder.

## GitHub

Create an empty GitHub repository, then run:

```bash
git remote add origin https://github.com/YOUR_NAME/notepad-macos.git
git push -u origin main
```
