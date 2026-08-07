pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

QtObject {

    id: root

    property Process proc: Process { }

    function run(cmd) {

        proc.running = false
        proc.command = ["bash", "-c", cmd]
        proc.running = true

    }

    function reloadShell() {

        run("pkill quickshell && quickshell -c ~/.local/src/Brain_Shell &")

    }

    function restartHyprland() {

        run("hyprctl dispatch exit")

    }

    function reloadHypr() {

        run("hyprctl reload")

    }

    function openConfigFolder() {

        run("xdg-open ~/.config/Brain_Shell")

    }

    function openSourceFolder() {

        run("xdg-open ~/.local/src/Brain_Shell")

    }

    function openGithub() {

        run("xdg-open https://github.com/KendrickMathers/Brain_Shell")

    }

}
