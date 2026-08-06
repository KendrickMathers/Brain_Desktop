import QtQuick
import "../theme"

Rectangle {

    width: parent ? parent.width : 200
    height: 1

    color: Qt.rgba(
        Theme.border.r,
        Theme.border.g,
        Theme.border.b,
        0.6
    )

}
