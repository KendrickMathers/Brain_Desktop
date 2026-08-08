pragma Singleton

import QtQuick

QtObject {

    id: root


    property real barOpacity: 0.85


    signal settingsChanged()


    function setBarOpacity(value) {

        barOpacity = Math.max(
            0.0,
            Math.min(
                1.0,
                value
            )
        )

        settingsChanged()

    }

}
