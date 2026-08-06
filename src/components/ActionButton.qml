import QtQuick
import "../theme"

Rectangle {

    id: root

    property alias text: label.text

    signal clicked()

    width: parent ? parent.width : 200
    height: 42

    radius: Theme.cornerRadius

    color: mouse.containsMouse
        ? Qt.rgba(
            Theme.active.r,
            Theme.active.g,
            Theme.active.b,
            0.18)
        : Qt.rgba(1,1,1,0.04)

    border.width: 1
    border.color: Theme.border

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Text {
        id: label

        anchors.centerIn: parent

        text: ""

        color: Theme.text

        font.pixelSize: 13
        font.weight: Font.Medium
    }

    MouseArea {
        id: mouse

        anchors.fill: parent

        hoverEnabled: true

        onClicked: root.clicked()
    }

}
