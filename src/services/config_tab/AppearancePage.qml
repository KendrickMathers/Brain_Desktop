import QtQuick
import "../../"
import "../../components"
import "../"


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

                title: "Bar Transparency"

                subtitle: "Change top bar opacity"



                Row {

                    spacing: 10



                    Rectangle {

                        width: 35
                        height: 28
                        radius: 14


                        color: Theme.active



                        Text {

                            anchors.centerIn: parent

                            text: "-"

                            color: Theme.background

                        }



                        MouseArea {

                            anchors.fill: parent



                            onClicked: {


                                SettingsService.setBarOpacity(

                                    Math.max(

                                        0.0,

                                        SettingsService.barOpacity - 0.05

                                    )

                                )

                            }

                        }

                    }





                    Text {

                        width: 50


                        text:

                        Math.round(

                            SettingsService.barOpacity * 100

                        ) + "%"



                        color: Theme.text


                        horizontalAlignment:

                        Text.AlignHCenter

                    }





                    Rectangle {


                        width: 35

                        height: 28

                        radius: 14



                        color: Theme.active




                        Text {

                            anchors.centerIn: parent


                            text: "+"


                            color: Theme.background

                        }




                        MouseArea {

                            anchors.fill: parent



                            onClicked: {


                                SettingsService.setBarOpacity(

                                    Math.min(

                                        1.0,

                                        SettingsService.barOpacity + 0.05

                                    )

                                )


                            }

                        }

                    }


                }

            }



            Divider {}



            SettingRow {


                title: "Corner Radius"

                subtitle: "Rounded UI"



                Text {

                    text: "Update Soon"

                    color: Theme.subtext

                }

            }



            Divider {}



            SettingRow {


                title: "Blur"

                subtitle: "Glass effect"



                Text {

                    text: "Update Soon"

                    color: Theme.subtext

                }

            }



        }

    }

}
