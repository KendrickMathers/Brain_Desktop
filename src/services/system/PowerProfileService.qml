pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {

    id: root


    property string currentProfile: "balanced"



    Process {

        id: readProc

        command: [
            "powerprofilesctl",
            "get"
        ]

        running: false


        stdout: SplitParser {

            onRead: data => {

                root.currentProfile = data.trim()

            }
        }
    }



    Process {

        id: setProc

        command: []

        running: false


        onExited: {

            root.readProfile()

        }
    }



    function readProfile() {

        readProc.running = false

        readProc.running = true

    }



    function setProfile(profile) {

        setProc.command = [
            "powerprofilesctl",
            "set",
            profile
        ]


        setProc.running = true

    }



    Component.onCompleted: {

        readProfile()

    }
}
