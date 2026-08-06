pragma Singleton

import QtQuick

QtObject {

    id: root

    property string currentWallpaper: ""
    property bool busy: false

    signal wallpaperChanged(string path)

    function browseImages() {
        console.log("Browse Images")
    }

    function browseVideos() {
        console.log("Browse Videos")
    }

    function randomWallpaper() {
        console.log("Random Wallpaper")
    }

    function applyWallpaper(path) {

        if(path === "")
            return

        busy = true

        currentWallpaper = path

        wallpaperChanged(path)

        busy = false
    }

}
