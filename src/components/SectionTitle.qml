import QtQuick
import "../theme"

Item {

    id: root

    property alias text: title.text

    width: parent ? parent.width : 200
    height: 34

    Text {

        id: title

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        text: ""

        color: Theme.text

        font.pixelSize: 18
        font.bold: true

    }

}
