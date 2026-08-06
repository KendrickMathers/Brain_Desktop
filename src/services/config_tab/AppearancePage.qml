import QtQuick
import "../../"
import "../../components"

Item {

    anchors.fill: parent


    PopupPage {

        anchors.fill: parent


        SettingCard {

            width: parent.width


            SectionTitle {

                text: "Appearance"

            }



            SettingRow {

                title: "Accent Color"

                subtitle: "Material You colors powered by Matugen"



                Rectangle {

                    width: 90

                    height: 28


                    radius: 14


                    color: Qt.rgba(
                        Theme.active.r,
                        Theme.active.g,
                        Theme.active.b,
                        0.18
                    )


                    border.color: Theme.active

                    border.width: 1



                    Text {

                        anchors.centerIn: parent


                        text: "Matugen"


                        color: Theme.active


                        font.pixelSize: 11

                    }

                }

            }



            Divider {}



            SettingRow {

                title: "Blur & Transparency"

                subtitle: "Glass effects"



                Rectangle {

                    width: 90

                    height: 28


                    radius: 14


                    color: Qt.rgba(
                        Theme.active.r,
                        Theme.active.g,
                        Theme.active.b,
                        0.18
                    )


                    border.color: Theme.active

                    border.width: 1



                    Text {

                        anchors.centerIn: parent


                        text: "Soon"


                        color: Theme.active


                        font.pixelSize: 11

                    }

                }

            }



            Divider {}



            SettingRow {

                title: "Corner Radius"

                subtitle: "Rounded corners"



                Rectangle {

                    width: 90

                    height: 28


                    radius: 14


                    color: Qt.rgba(
                        Theme.active.r,
                        Theme.active.g,
                        Theme.active.b,
                        0.18
                    )


                    border.color: Theme.active

                    border.width: 1



                    Text {

                        anchors.centerIn: parent


                        text: "Soon"


                        color: Theme.active


                        font.pixelSize: 11

                    }

                }

            }

        }

    }

}
