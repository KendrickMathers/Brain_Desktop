pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

QtObject {

    id: root

    property Process proc: Process { }

   function open(path) {
    
        proc.running = false
    
        proc.command = [
            "bash",
            "-c",
            "xdg-open \"$1\"",
            "bash",
            path
        ]
    
        proc.running = true
    }

    function config() {
        open(Quickshell.env("HOME") + "/.config/Brain_Shell")
    }

    function source() {
        open(Quickshell.env("HOME") + "/.local/src/Brain_Shell")
    }

    function wallpapers() {
        open(Quickshell.env("HOME") + "/Pictures/Wallpapers")
    }

    function github() {
        open("https://github.com/KendrickMathers/Brain_Shell")
    }

}
