import QtQuick
import "../../"
import "../../components"

PopupPage {

    SettingCard {

        width: parent.width

        SectionTitle {
            text: "Brain Shell"
        }

        SettingRow {
            title: "Version"
            subtitle: "Current development version"

            Text {
                text: "0.2.0-dev"
                color: Theme.text
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        SettingRow {
            title: "Qt"

            Text {
                text: Qt.version
                color: Theme.text
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        SettingRow {
            title: "Quickshell"

            Text {
                text: "Detected at runtime"
                color: Theme.subtext
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        SettingRow {
            title: "Hyprland"

            Text {
                text: "Detected at runtime"
                color: Theme.subtext
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    SettingCard {

        width: parent.width

        SectionTitle {
            text: "Actions"
        }

        ActionButton {
            text: "Reload Shell"
        }

        ActionButton {
            text: "Open Config Folder"
        }

        ActionButton {
            text: "Open GitHub"
        }
    }
}
