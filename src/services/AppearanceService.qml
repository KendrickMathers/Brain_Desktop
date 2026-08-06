pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

QtObject {

    id: root

    property string mode: "auto"
    property string accent: "matugen"

    readonly property string configFile:
        Quickshell.env("HOME") +
        "/.config/Brain_Shell/colors.conf"

    property Process proc: Process {

        stdout: SplitParser {

            onRead: function(line) {

                var text = line.trim()

                if (text.startsWith("mode="))
                    root.mode = text.substring(5)

                else if (text.startsWith("accent="))
                    root.accent = text.substring(7)

            }

        }

    }

    function reload() {

        proc.running = false

        proc.command = [
            "cat",
            configFile
        ]

        proc.running = true

    }

    Component.onCompleted: reload()

}
