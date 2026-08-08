import QtQuick
import QtQuick.Effects
import Quickshell.Io
import Quickshell
import "../../"
import "../../components"
import "../../services"


// Profile card — circular avatar, editable username, window manager, uptime.

StatCard {

    id: root

    padding: 0


    property string avatarPath: ProfileService.avatarPath

    property string _wm: ""
    property string _uptime: ""



    Process {

        command: [
            "bash",
            "-c",
            "echo ${XDG_CURRENT_DESKTOP:-Hyprland}"
        ]

        running: true


        stdout: SplitParser {

            onRead: function(line) {

                if (line.trim() !== "")
                    root._wm = line.trim()

            }

        }

    }



    Process {

        id: uptimeProc


        command: [
            "bash",
            "-c",
            "uptime -p | sed 's/up //' | sed 's/ hours\\?/h/' | sed 's/ minutes\\?/m/' | sed 's/ days\\?/d/' | sed 's/, / /g'"
        ]


        running: false


        stdout: SplitParser {

            onRead: function(line) {

                if (line.trim() !== "")
                    root._uptime = line.trim()

            }

        }

    }



    Timer {

        interval: 60000

        running: true

        repeat: true


        onTriggered: {

            uptimeProc.running = false
            uptimeProc.running = true

        }

    }



    Component.onCompleted: {

        uptimeProc.running = true

    }




    Row {

        anchors {

            left: parent.left
            leftMargin: 16

            right: parent.right
            rightMargin: 16

            verticalCenter: parent.verticalCenter

        }


        spacing: 18





        // Avatar

        Item {

            width: 72
            height: 72



            MouseArea {

                anchors.fill: parent

                cursorShape: Qt.PointingHandCursor


                onClicked: {

                    ProfileService.chooseAvatar()

                }

            }



            Rectangle {

                anchors.fill: parent

                radius: width / 2


                gradient: Gradient {

                    GradientStop {

                        position: 0.0

                        color: Qt.rgba(
                            166/255,
                            208/255,
                            247/255,
                            0.22
                        )

                    }


                    GradientStop {

                        position: 1.0

                        color: Qt.rgba(
                            80/255,
                            130/255,
                            190/255,
                            0.14
                        )

                    }

                }


                border.color: Qt.rgba(
                    166/255,
                    208/255,
                    247/255,
                    0.22
                )


                border.width: 1

            }




            Rectangle {

                id: photoMask

                anchors.fill: parent

                radius: width / 2

                visible: false

                layer.enabled: true

            }




            Image {

                anchors.fill: parent


                source:

                    ProfileService.avatarPath !== ""

                    ? "file://" + ProfileService.avatarPath

                    : ""


                cache: false


                fillMode: Image.PreserveAspectCrop

                smooth: true


                visible:

                    ProfileService.avatarPath !== ""



                layer.enabled: true


                layer.effect: MultiEffect {

                    maskEnabled: true

                    maskSource: photoMask

                    maskThresholdMin: 0.5

                    maskSpreadAtMin: 1.0

                }

            }




            Text {

                anchors.centerIn: parent


                text: "󰀄"

                font.pixelSize: 28

                color: Theme.active


                visible:

                    ProfileService.avatarPath === ""

            }


        }







        // Profile text

        Column {

            anchors.verticalCenter: parent.verticalCenter

            spacing: 10





            // Editable name

            Item {

                width: 170

                height: 26



                Text {

                    id: nameText


                    anchors.fill: parent


                    text: ProfileService.profileName


                    font.pixelSize: 17

                    font.weight: Font.DemiBold


                    color: Theme.active


                    verticalAlignment: Text.AlignVCenter


                    visible: !nameInput.visible



                    MouseArea {

                        anchors.fill: parent


                        cursorShape: Qt.PointingHandCursor


                        onClicked: {

                            nameInput.visible = true

                            nameInput.text =
                                ProfileService.profileName


                            nameInput.forceActiveFocus()

                            nameInput.selectAll()

                        }

                    }

                }




                TextInput {

                    id: nameInput


                    anchors.fill: parent


                    visible: false


                    text: ProfileService.profileName


                    font.pixelSize: 17

                    font.weight: Font.DemiBold


                    color: Theme.active


                    verticalAlignment:
                        Text.AlignVCenter



                    selectByMouse: true



                    onAccepted: {

                        let value = text.trim()


                        if (value !== "") {

                            ProfileService.setName(value)

                        }


                        visible = false

                    }



                    Keys.onEscapePressed: {

                        visible = false

                    }


                }

            }








            Row {

                spacing: 8



                Text {

                    text: "󰣇"

                    font.pixelSize: 12

                    color: Theme.active


                    anchors.verticalCenter:
                        parent.verticalCenter

                }




                Text {

                    text: root._wm

                    font.pixelSize: 12


                    color: Qt.rgba(
                        205/255,
                        214/255,
                        244/255,
                        0.55
                    )


                    anchors.verticalCenter:
                        parent.verticalCenter

                }

            }







            Row {

                spacing: 8



                Text {

                    text: "󰔚"

                    font.pixelSize: 12

                    color: Theme.active


                    anchors.verticalCenter:
                        parent.verticalCenter

                }




                Text {

                    text: root._uptime

                    font.pixelSize: 12


                    font.family:
                        "JetBrains Mono"


                    color: Qt.rgba(
                        205/255,
                        214/255,
                        244/255,
                        0.55
                    )


                    anchors.verticalCenter:
                        parent.verticalCenter

                }

            }


        }


    }


}
