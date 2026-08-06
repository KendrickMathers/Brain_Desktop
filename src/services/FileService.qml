pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {

    id: root

    property Process proc: Process { }

    function open(path) {
        proc.running=false
        proc.command=["xdg-open",path]
        proc.running=true
    }

    function config() {
        open(Quickshell.env("HOME")+"/.config/Brain_Shell")
    }

    function source() {
        open(Quickshell.env("HOME")+"/.local/src/Brain_Shell")
    }

    function github() {
        open("https://github.com/Brainitech/Brain_Shell")
    }

}
