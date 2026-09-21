#!/bin/zsh
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"
BUILD_DIR="$PROJECT_DIR/build"
APP_PATH="$BUILD_DIR/Release/Notepad.app"
ARCHIVE_PATH="$BUILD_DIR/Notepad.xcarchive"
DMG_PATH="$PROJECT_DIR/Notepad.dmg"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

xcodebuild -project Notepad.xcodeproj -scheme Notepad -configuration Release \
  -archivePath "$ARCHIVE_PATH" archive CODE_SIGN_STYLE=Automatic

mkdir -p "$BUILD_DIR/dmg/Notepad"
cp -R "$APP_PATH" "$BUILD_DIR/dmg/Notepad/"
ln -s /Applications "$BUILD_DIR/dmg/Applications"
hdiutil create -volname "Notepad" -srcfolder "$BUILD_DIR/dmg" -ov -format UDZO "$DMG_PATH"
echo "Created $DMG_PATH"
