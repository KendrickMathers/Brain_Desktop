import QtQuick
import "../../"
import "../../components"
import "../../services"
Item {

    anchors.fill: parent

    PopupPage {

        anchors.fill: parent

        Column {

            width: parent.width

            spacing: 18

            Text {
                text: "Wallpaper"
                font.pixelSize: 24
                font.bold: true
                color: Theme.text
            }

            Rectangle {

                width: parent.width
                height: 220

                radius: Theme.cornerRadius

                color: Qt.rgba(1,1,1,0.05)

                border.width: 1
                border.color: Theme.border

                Column {

                    anchors.centerIn: parent

                    spacing: 8

                    Text {

                        text: "Wallpaper Preview"

                        font.pixelSize: 16

                        color: Theme.text
                    }

                    Text {

                        text: "Preview will be added in Sprint 2"

                        color: Theme.subtext

                        font.pixelSize: 12
                    }

                }

            }

            Repeater {

                model: [

                    "Browse Images",

                    "Browse Videos",

                    "Random Wallpaper",

                    "Apply Wallpaper"

                ]

                delegate: Rectangle {

                    width: parent.width

                    height: 48

                    radius: Theme.cornerRadius

                    color: Qt.rgba(1,1,1,0.05)

                    border.width: 1
                    border.color: Theme.border

                    HoverHandler {
                        id: hover
                    }

                    Rectangle {

                        anchors.fill: parent

                        radius: parent.radius

                        color: hover.hovered
                            ? Qt.rgba(
                                  Theme.active.r,
                                  Theme.active.g,
                                  Theme.active.b,
                                  0.15
                              )
                            : "transparent"

                        Behavior on color {
                            ColorAnimation { duration: 120 }
                        }

                    }

                    Text {

                        anchors.centerIn: parent

                        text: modelData

                        color: Theme.text

                        font.pixelSize: 14
                    }

                    MouseArea {

                        anchors.fill: parent

                        onClicked: {

                            console.log(modelData)

                        }

                    }

                }

            }

            Rectangle {

                width: parent.width

                height: 60

                radius: Theme.cornerRadius

                color: Qt.rgba(1,1,1,0.05)

                border.width: 1
                border.color: Theme.border

                Column {

                    anchors.centerIn: parent

                    spacing: 4

                    Text {

                        text: "Current Wallpaper"

                        color: Theme.text
                    }

                    Text {

                        text: "Not Loaded"

                        color: Theme.subtext

                        font.pixelSize: 12
                    }

                }

            }

        }

    }

}
