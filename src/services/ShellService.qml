pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {

    id: root

    property Process proc: Process { }

    function run(cmd) {
        proc.running = false
        proc.command = ["bash","-c",cmd]
        proc.running = true
    }

    function reloadShell() {
        run("pkill quickshell && quickshell -c ~/.local/src/Brain_Shell &")
    }

    function reloadHypr() {
        run("hyprctl reload")
    }

    function restartHyprland() {
        run("hyprctl dispatch exit")
    }

}
