import QtQuick
import Quickshell
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

                    height: 160

                    radius: Theme.cornerRadius


                    color: Qt.rgba(1,1,1,0.04)


                    border.width: 1

                    border.color: Theme.border



                    Text {

                        anchors.centerIn: parent


                        text: "Wallpaper Preview"


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

                        FileService.open(
                            Quickshell.env("HOME") +
                            "/Pictures/Wallpapers"
                        )

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

                        FileService.open(
                            Quickshell.env("HOME") +
                            "/Pictures/Wallpapers"
                        )

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



                    subtitle:
                        WallpaperService.currentWallpaper === ""
                        ? "Not Loaded"
                        : WallpaperService.currentWallpaper

                }
            }
        }
    }
}
