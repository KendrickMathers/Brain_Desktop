import QtQuick

Rectangle {

    id: root

    property alias title: titleLabel.text
    property alias subtitle: subtitleLabel.text

    default property alias content: rightSide.data

    width: parent.width
    height: 60

    radius: Theme.cornerRadius

    color: Qt.rgba(1,1,1,0.04)

    border.width: 1
    border.color: Theme.border

    Row {

        anchors.fill: parent

        anchors.leftMargin: 18
        anchors.rightMargin: 18

        spacing: 18

        Column {

            anchors.verticalCenter: parent.verticalCenter

            spacing: 2

            Text {

                id: titleLabel

                color: Theme.text

                font.pixelSize: 14

                font.bold: true

            }

            Text {

                id: subtitleLabel

                color: Theme.subtext

                font.pixelSize: 11

            }

        }

        Item {

            Layout.fillWidth: true

        }

        Row {

            id: rightSide

            anchors.verticalCenter: parent.verticalCenter

        }

    }

}
