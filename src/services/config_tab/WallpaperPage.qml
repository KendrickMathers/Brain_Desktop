import QtQuick
import "../../"
import "../../components"
import "../../services"

Item {
    anchors.fill: parent

    PopupPage {
        anchors.fill: parent

        Column {
            width: parent.width
            spacing: 18

            SettingCard {
                width: parent.width

                SectionTitle {
                    text: "Wallpaper"
                }

                Rectangle {
                    width: parent.width - 32
                    height: 200

                    radius: Theme.cornerRadius

                    color: Qt.rgba(1, 1, 1, 0.04)

                    border.width: 1
                    border.color: Theme.border

                    clip: true

                    Image {
                        anchors.fill: parent
                        anchors.margins: 1

                        fillMode: Image.PreserveAspectCrop
                        smooth: true
                        cache: false

                        visible: WallpaperService.currentWallpaper !== ""

                        source: WallpaperService.currentWallpaper === ""
                            ? ""
                            : "file://" + WallpaperService.currentWallpaper
                    }

                    Text {
                        anchors.centerIn: parent

                        visible: WallpaperService.currentWallpaper === ""

                        text: "No Preview"

                        color: Theme.subtext

                        font.pixelSize: 14
                    }
                }
            }

            SettingCard {
                width: parent.width

                SectionTitle {
                    text: "Actions"
                }

                ActionButton {
                    text: "Browse Images"

                    onClicked: {
                        WallpaperService.browseImages()
                    }
                }

                ActionButton {
                    text: "Browse Videos"

                    onClicked: {
                        // Sprint berikutnya
                    }
                }

                ActionButton {
                    text: "Random Wallpaper"

                    onClicked: {
                        WallpaperService.randomWallpaper()
                    }
                }

                ActionButton {
                    text: "Open Wallpaper Folder"

                    onClicked: {
                        FileService.wallpapers()
                    }
                }
            }

            SettingCard {
                width: parent.width

                SectionTitle {
                    text: "Status"
                }

                SettingRow {
                    title: "Current Wallpaper"

                    subtitle: WallpaperService.currentWallpaper === ""
                        ? "Not Loaded"
                        : WallpaperService.currentWallpaper.split("/").pop()
                }
            }
        }
    }
}
