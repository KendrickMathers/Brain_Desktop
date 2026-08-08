import QtQuick
import "../theme"

Item {

    id: root

    property real value: 0.85
    property color accent: Theme.active


    signal changed(real value)


    height: 24


    Rectangle {

        anchors.verticalCenter: parent.verticalCenter

        width: parent.width

        height: 6

        radius: 3

        color: Qt.rgba(1,1,1,0.12)

    }


    Rectangle {

        anchors.verticalCenter: parent.verticalCenter

        width: parent.width * root.value

        height: 6

        radius: 3

        color: root.accent

    }


    Rectangle {

        width: 14

        height: 14

        radius: 7

        color: Theme.text

        anchors.verticalCenter: parent.verticalCenter

        x: (parent.width * root.value) - width/2

    }


    MouseArea {

        anchors.fill: parent


        onPressed: update(mouse.x)

        onPositionChanged: {

            if(mouse.buttons)

                update(mouse.x)

        }


        function update(pos) {

            let v = pos / root.width

            v = Math.max(0.2, Math.min(1,v))

            root.value = v

            root.changed(v)

        }

    }

}
