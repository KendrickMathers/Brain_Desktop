import QtQuick
import "../"
import "../../"
import "../../components"
import "./"

Item {
    id: root

    property string currentPage: "appearance"

    readonly property var tabs: [
        { key: "appearance", icon: "󰏘", label: "Appearance" },
        { key: "wallpaper",  icon: "󰉉", label: "Wallpaper" },
        { key: "keybinds",   icon: "󰌌", label: "Keybinds" },
    ]

    Row {

        anchors.fill: parent
        anchors.margins: 8

        spacing: 12

        Rectangle {

            width: Math.floor((parent.width - parent.spacing) * 0.30)

            height: parent.height

            radius: Theme.cornerRadius

            color: Qt.rgba(1,1,1,0.04)

            border.width: 1
            border.color: Qt.rgba(1,1,1,0.07)

            TabSwitcher {

                anchors.fill: parent

                anchors.margins: 6

                orientation: "vertical"

                model: root.tabs

                currentPage: root.currentPage

                onPageChanged: function(page) {

                    root.currentPage = page

                }

            }

        }

        Loader {

            id: pageLoader

            width: parent.width
                   - Math.floor((parent.width-parent.spacing)*0.30)
                   - parent.spacing

            height: parent.height

            source: {

                switch(root.currentPage){
                
                case "appearance":
                    return "AppearancePage.qml"
                
                case "wallpaper":
                    return "WallpaperPage.qml"
                
                case "keybinds":
                    return "KeybindsPage.qml"
                
                default:
                    return "AppearancePage.qml"
                

                }

            }

        }

    }

}
