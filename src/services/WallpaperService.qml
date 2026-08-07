pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io


QtObject {

    id: root


    property string currentWallpaper: ""

    property bool busy: false

    property bool reloadAfterExit: false


    signal wallpaperChanged(string path)



    readonly property string script:

        Quickshell.env("HOME") +
        "/.local/src/Brain_Shell/src/scripts/wallpaper.sh"





    // ==========================
    // File Picker
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


            if (exitCode !== 0 && exitCode !== 15)

                console.log(
                    "WallpaperService failed:",
                    exitCode
                )

        }

    }





    // ==========================
    // Restore Process
    // ==========================

    property Process restoreProc: Process {


        stdout: SplitParser {


            onRead: function(line) {


                var file = line.trim()


                if (file === "")

                    return



                console.log(
                    "Restoring wallpaper:",
                    file
                )



                root.currentWallpaper = file

                root.wallpaperChanged(file)



                root.run([
                    "apply",
                    file
                ])

            }

        }

    }





    function run(args) {


        console.log(
            "WallpaperService:",
            [script].concat(args).join(" ")
        )



        proc.running = false


        proc.command = [
            script
        ].concat(args)



        proc.running = true

    }





    function reloadCurrentWallpaper() {

        run([
            "current"
        ])

    }





    function restoreWallpaper() {


        restoreProc.running = false



        restoreProc.command = [

            script,

            "current"

        ]



        restoreProc.running = true

    }





    function applyWallpaper(path) {


        if (path === "")

            return



        busy = true



        currentWallpaper = path


        wallpaperChanged(path)



        run([

            "apply",

            path

        ])

    }





    function browseImages() {


        picker.running = false



        picker.command = [


            "zenity",


            "--file-selection",


            "--title=Choose Image Wallpaper",


            "--filename=" +

            Quickshell.env("HOME") +

            "/Pictures/Wallpapers/Images/",


            "--file-filter=Images | *.png *.jpg *.jpeg *.webp"


        ]



        picker.running = true

    }





    function browseVideos() {


        picker.running = false



        picker.command = [


            "zenity",


            "--file-selection",


            "--title=Choose Video Wallpaper",


            "--filename=" +

            Quickshell.env("HOME") +

            "/Pictures/Wallpapers/Videos/",


            "--file-filter=Videos | *.mp4 *.mkv *.webm *.mov"


        ]



        picker.running = true

    }





    function randomWallpaper() {


        run([

            "random"

        ])

    }





    Component.onCompleted: {


        restoreWallpaper()

    }

}
