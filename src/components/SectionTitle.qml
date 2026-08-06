import QtQuick

Item {

    property alias text: title.text

    width: parent.width
    height: 34

    Text {

        id: title

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        font.pixelSize: 18
        font.bold: true

        color: Theme.text

    }

}
