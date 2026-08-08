pragma Singleton

import QtQuick


QtObject {


    property real opacity: 0.85

    property int blur: 20

    property int cornerRadius: 17

    property int animationSpeed: 320



    signal settingsChanged()



    function setOpacity(value) {

        opacity = value

        settingsChanged()

    }



    function setBlur(value) {

        blur = value

        settingsChanged()

    }



    function setCornerRadius(value) {

        cornerRadius = value

        settingsChanged()

    }



    function setAnimationSpeed(value) {

        animationSpeed = value

        settingsChanged()

    }


}
