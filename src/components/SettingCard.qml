import QtQuick
import "../theme"

Rectangle {
    id: root

    default property alias content: body.data

    radius: Theme.cornerRadius

    color: Qt.rgba(1, 1, 1, 0.05)

    border.width: 1
    border.color: Qt.rgba(1, 1, 1, 0.08)

    implicitWidth: 400
    implicitHeight: body.implicitHeight + 32

    Column {
        id: body

        anchors.fill: parent
        anchors.margins: 16

        spacing: 14
    }
}
