pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

QtObject {

    id: root

    property string currentWallpaper: ""
    property bool busy: false

    // digunakan agar setelah random selesai,
    // otomatis reload wallpaper yang aktif
    property bool reloadAfterExit: false

    signal wallpaperChanged(string path)

    readonly property string script:
        Quickshell.env("HOME") +
        "/.local/src/Brain_Shell/src/scripts/wallpaper.sh"

    // ==========================
    // File Picker (Zenity)
    // ==========================
    property Process picker: Process {

        stdout: SplitParser {

            onRead: function(line) {

                var file = line.trim()

                if (file !== "")
                    root.applyWallpaper(file)

            }

        }

    }

    // ==========================
    // Backend Process
    // ==========================
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

            // random selesai → reload wallpaper aktif
            if (exitCode === 0 && root.reloadAfterExit) {

                root.reloadAfterExit = false
                root.reloadCurrentWallpaper()
                return

            }

            // abaikan SIGTERM (15)
            if (exitCode !== 0 && exitCode !== 15)
                console.log("WallpaperService: command failed (" + exitCode + ")")

        }

    }

    function run(args) {

        console.log(
            "WallpaperService:",
            [script].concat(args).join(" ")
        )

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

        currentWallpaper = path
        wallpaperChanged(path)

        run(["apply", path])

    }

    function randomWallpaper() {

        busy = true

        reloadAfterExit = true

        run(["random"])

    }

    function browseImages() {

        picker.running = false

        picker.command = [

            "zenity",

            "--file-selection",

            "--title=Choose Wallpaper",

            "--filename=" +
                Quickshell.env("HOME") +
                "/Pictures/Wallpapers/",

            "--file-filter=Images | *.png *.jpg *.jpeg *.webp"

        ]

        picker.running = true

    }

    Component.onCompleted: {

        reloadCurrentWallpaper()

    }

}
