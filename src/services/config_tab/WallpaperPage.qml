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

                        WallpaperService.browseVideos()

                    }

                }





                ActionButton {


                    text: "Open Wallpaper Folder"



                    onClicked: {


                        FileService.open(

                            Quickshell.env("HOME")

                            + "/Pictures/Wallpapers"

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
