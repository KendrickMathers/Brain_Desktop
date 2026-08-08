import Quickshell
import QtQuick

import "../components"
import "../modules/Center/"
import "../modules/Right/"
import "../modules/Left/"
import "../"
import "../shapes/"
import "../services"


PanelWindow {

    id: root


    property string screenName: screen ? screen.name : ""


    color:"transparent"
        


    anchors {

        top: true
        left: true
        right: true

    }



    Binding {

        target: ShellState
        property: "topBarLWidth"
        value: root.lWidth

    }


    Binding {

        target: ShellState
        property: "topBarCWidth"
        value: root.cWidth

    }


    Binding {

        target: ShellState
        property: "topBarRWidth"
        value: root.rWidth

    }




    implicitHeight:
        ShellState.focusMode
        ? Theme.borderWidth
        : Theme.notchHeight



    exclusiveZone:
        ShellState.focusMode
        ? 0
        : Theme.exclusionGap





    readonly property int lWidth:

        Math.max(
            Theme.lNotchMinWidth,
            Math.min(
                Theme.lNotchMaxWidth,
                leftContent.implicitWidth +
                Theme.notchPadding * 2
            )
        )




    property int cWidth:

        Popups.dashboardOpen
        ? Popups.dashboardPageWidth

        :

        Math.max(
            Theme.cNotchMinWidth,
            Math.min(
                Theme.cNotchMaxWidth,
                centerContent.implicitWidth +
                Theme.notchPadding * 2
            )
        )




    property int rWidth:

        Math.max(
            Theme.rNotchMinWidth,
            Math.min(
                Theme.rNotchMaxWidth,
                rightContent.implicitWidth +
                Theme.notchPadding * 2
            )
        )





    Item {
        
            id: barLayer
        
            anchors.fill: parent
        
        
            opacity:
        
                ShellState.focusMode
        
                ? 0
        
                : SettingsService.barOpacity
        
        
            Behavior on opacity {
        
                NumberAnimation {
        
                    duration: 250
        
                }
        
            }
        
        
            SeamlessBarShape {
        
                id: barShape
        
                anchors.fill: parent
        
        
                leftWidth: root.lWidth
        
                centerWidth: root.cWidth
        
                rightWidth: root.rWidth
        
            }
        }


        Item {

            id: leftNotch


            width:
                root.lWidth


            height:
                Theme.notchHeight


            anchors.left:
                parent.left




            LeftContent {

                id: leftContent


                anchors.centerIn:
                    parent

            }

        }





        Item {

            id: centerNotch


            width:
                root.cWidth


            height:
                Theme.notchHeight


            anchors.centerIn:
                parent





            CenterContent {

                id: centerContent


                anchors.centerIn:
                    parent

            }

        }





        Item {

            id: rightNotch


            width:
                root.rWidth


            height:
                Theme.notchHeight


            anchors.right:
                parent.right



            clip: true





            RightContent {

                id: rightContent


                anchors.right:
                    parent.right


                anchors.verticalCenter:
                    parent.verticalCenter


                anchors.rightMargin:
                    Theme.notchPadding

        }


    }


}
