import QtQuick
import "../"

Canvas {

    id: root

    anchors.fill: parent


    property int leftWidth: Theme.lNotchMinWidth
    property int centerWidth: Theme.cNotchMinWidth
    property int rightWidth: Theme.rNotchMinWidth


    property int notchHeight: Theme.notchHeight
    property int radius: Theme.notchRadius
    property int topBorderWidth: Theme.borderWidth


    property color color:
    
        Qt.rgba(
            Theme.background.r,
            Theme.background.g,
            Theme.background.b,
            1
        )



    onWidthChanged: requestPaint()
    onHeightChanged: requestPaint()

    onLeftWidthChanged: requestPaint()
    onCenterWidthChanged: requestPaint()
    onRightWidthChanged: requestPaint()

    onColorChanged: requestPaint()



    onPaint: {

        var ctx = getContext("2d")
        ctx.reset()


        var leftW = root.leftWidth
        var centerW = root.centerWidth
        var rightW = root.rightWidth

        var r = root.radius
        var h = root.notchHeight
        var b = root.topBorderWidth
        var w = width


        var centerStart = (w / 2) - (centerW / 2)
        var centerEnd = (w / 2) + (centerW / 2)

        var rightStart = w - rightW



        ctx.beginPath()

        ctx.fillStyle = root.color



        ctx.moveTo(0,h)

        ctx.lineTo(leftW-r,h)
        ctx.arcTo(leftW,h,leftW,h-r,r)

        ctx.lineTo(leftW,b+r)
        ctx.arcTo(leftW,b,leftW+r,b,r)



        ctx.lineTo(centerStart-r,b)

        ctx.arcTo(centerStart,b,centerStart,b+r,r)

        ctx.lineTo(centerStart,h-r)

        ctx.arcTo(centerStart,h,centerStart+r,h,r)


        ctx.lineTo(centerEnd-r,h)

        ctx.arcTo(centerEnd,h,centerEnd,h-r,r)

        ctx.lineTo(centerEnd,b+r)

        ctx.arcTo(centerEnd,b,centerEnd+r,b,r)



        ctx.lineTo(rightStart-r,b)

        ctx.arcTo(rightStart,b,rightStart,b+r,r)

        ctx.lineTo(rightStart,h-r)

        ctx.arcTo(rightStart,h,rightStart+r,h,r)



        ctx.lineTo(w,h)

        ctx.lineTo(w,0)

        ctx.lineTo(0,0)

        ctx.closePath()


        ctx.fill()

    }

}
