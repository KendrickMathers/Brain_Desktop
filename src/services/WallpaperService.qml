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



            if (exitCode === 0 && root.reloadAfterExit) {


                root.reloadAfterExit = false

                root.reloadCurrentWallpaper()

                return

            }



            if (exitCode !== 0 && exitCode !== 15)

                console.log(
                    "WallpaperService failed:",
                    exitCode
                )

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

        run(["current"])

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





    function randomWallpaper() {


        busy = true


        reloadAfterExit = true


        run([

            "random"

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
                "/Pictures/Wallpapers/",


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
                "/Videos/Wallpapers/",


            "--file-filter=Videos | *.mp4 *.mkv *.webm *.mov"


        ]



        picker.running = true

    }





    Component.onCompleted: {


        reloadCurrentWallpaper()

    }

}
