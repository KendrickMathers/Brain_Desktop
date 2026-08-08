pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import "../state"


QtObject {

    id: root


    property string profileName: "User"

    property string avatarPath: ""

    property string pendingAvatarPath: ""


    property string configPath:
        Quickshell.shellDir + "/config/profile.json"



    property string jsonBuffer: ""





    property var checkProcess: Process {

        command: []

        running: false


        stdout: SplitParser {

            onRead: function(line) {

                if (line.trim() === "missing") {

                    root.createDefaultProfile()

                } else {

                    root.readProfile()

                }

            }

        }

    }







    property var readProcess: Process {

        command: []

        running: false


        stdout: SplitParser {

            onRead: function(line) {

                root.jsonBuffer += line + "\n"

            }

        }


        onExited: {

            try {

                let data =
                    JSON.parse(root.jsonBuffer)



                root.profileName =
                    data.name || "User"



                root.avatarPath =
                    data.avatar || ""



                root.jsonBuffer = ""


            }

            catch(e) {

                console.log(
                    "Profile JSON error:",
                    e
                )


                root.jsonBuffer = ""


            }

        }

    }







    property var saveProcess: Process {

        command: []

        running: false

    }







    property var avatarPicker: Process {

        command: []

        running: false



        stdout: SplitParser {

            onRead: function(line) {


                let path =
                    line.trim()



                if (path !== "") {


                    root.pendingAvatarPath =
                        path



                    Popups.showConfirm(

                        "Change Profile Picture?",

                        "Use this image as your new profile picture?",

                        "Confirm",

                        "change-avatar"

                    )

                }

            }

        }

    }









    function loadProfile() {


        checkProcess.command = [

            "bash",

            "-c",

            "if [ -f \"" +
            configPath +
            "\" ]; then echo exists; else echo missing; fi"

        ]


        checkProcess.running = false

        checkProcess.running = true


    }







    function createDefaultProfile() {


        root.profileName =
            "User"


        root.avatarPath =
            ""


        saveProfile()


    }







    function readProfile() {


        root.jsonBuffer = ""



        readProcess.command = [

            "bash",

            "-c",

            "cat \"" +
            configPath +
            "\""

        ]



        readProcess.running = false

        readProcess.running = true


    }









    function saveProfile() {


        let json =
            JSON.stringify(

                {

                    "name":
                        root.profileName,


                    "avatar":
                        root.avatarPath

                },

                null,

                4

            )





        saveProcess.command = [

            "bash",

            "-c",

            "mkdir -p \"" +
            Quickshell.shellDir +
            "/config\" && printf '%s' '" +
            json.replace(/'/g, "'\\''") +
            "' > \"" +
            configPath +
            "\""

        ]



        saveProcess.running = false

        saveProcess.running = true


    }








    function setName(value) {
    
        if (!value || value.trim() === "")
            return
    
        root.profileName = value.trim()
    
        saveProfile()
    
    }








    function setAvatar(value) {


        root.avatarPath =
            value


        saveProfile()


    }








    function chooseAvatar() {


        avatarPicker.command = [

            "bash",

            "-c",

            "mkdir -p \"$HOME/Pictures/Profile\" && zenity --file-selection --title='Choose Profile Picture' --filename=\"$HOME/Pictures/Profile/\""

        ]


        avatarPicker.running = false

        avatarPicker.running = true


    }








    function confirmAvatar() {


        if (root.pendingAvatarPath !== "") {


            setAvatar(
                root.pendingAvatarPath
            )


            root.pendingAvatarPath = ""


        }

    }







    Component.onCompleted: {

        loadProfile()

    }

}
