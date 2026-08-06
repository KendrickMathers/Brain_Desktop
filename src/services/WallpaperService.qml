pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

QtObject {

    id: root

    property string currentWallpaper: ""
    property bool busy: false

    signal wallpaperChanged(string path)

    readonly property string script:
        Quickshell.env("HOME") +
        "/.local/src/Brain_Shell/src/scripts/wallpaper.sh"

    property Process proc: Process {

        stdout: SplitParser {
            onRead: function(line) {

                var text = line.trim()

                if (text !== "") {
                    root.currentWallpaper = text
                    root.wallpaperChanged(text)
                }
            }
        }

        onExited: function(exitCode) {
            root.busy = false

            if (exitCode !== 0)
                console.log("WallpaperService: command failed (" + exitCode + ")")
        }
    }

    function run(args) {
        proc.running = false
        proc.command = [script].concat(args)
        proc.running = true
    }

    function reloadCurrentWallpaper() {
        run(["current"])
    }

    function applyWallpaper(path) {

        if (path === "")
            return

        busy = true

        run(["apply", path])

        currentWallpaper = path
        wallpaperChanged(path)
    }

    function randomWallpaper() {

        busy = true

        run(["random"])

        Qt.callLater(function() {
            reloadCurrentWallpaper()
        })
    }

    Component.onCompleted: {
        reloadCurrentWallpaper()
    }

}
