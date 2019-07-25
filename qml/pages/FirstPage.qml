import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    Timer {
           id: clock
           property string time

           interval: 1000
           repeat: true
           running: true
           triggeredOnStart: true

           onTriggered: time = (new Date()).toTimeString()
       }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Call the Operator")
//                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
                onClicked: Qt.openUrlExternally("tel:+79991234567")
            }
        }

        // Tell SilicaFlickable the height of its content.
        //contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader { title: qsTr("Page UI") }

//            Text {
//             width: parent.width
//             text: (new Date()).toLocaleTimeString()
//             color: "red"
//             font.pointSize: 48
//             horizontalAlignment: Text.AlignHCenter
//            }


            Label {
//                text: (new Date()).toLocaleTimeString()
                text: clock.time
                font.pixelSize: Theme.fontSizeSmall
                width: parent.width
                horizontalAlignment: Label.AlignHCenter
//                anchors.centerIn: parent
            }

            Row {

                height: Theme.itemSizeMedium

                TextSwitch {
                    id: activationSwitch
                    width: 600
                    text: "Active"
                    description: "Zone: Lenina st. 35"
                    onCheckedChanged: {
                        device.setStatus(checked ? DeviceState.Armed : DeviceState.Disarmed)
                    }
                }

                Label {
                    id: deadline
                    text: "14:30"
                }
            }


            Row {

                height: Theme.itemSizeMedium

                TextSwitch {
                    id: activationSwitch2
                    width: 600
                    text: "Active"
                    description: "Zone: Lenina st. 35"
                    onCheckedChanged: {
                        device.setStatus(checked ? DeviceState.Armed : DeviceState.Disarmed)
                    }
                }

                Label {
                    id: deadline2
                    text: "15:35"
                }
            }


        }
    }
}
