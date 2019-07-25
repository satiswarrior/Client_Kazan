import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.Portrait

    Timer {
           id: clock
           property string time

           interval: 1000
           repeat: true
           running: true
           triggeredOnStart: true

           onTriggered: time = (new Date()).toTimeString()
       }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Call the Operator")
                onClicked: Qt.openUrlExternally("tel:+79991234567")
            }
        }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader { title: qsTr("Task no. 1") }

            Label {
                text: clock.time
                font.pixelSize: Theme.fontSizeSmall
                width: parent.width
                color: Theme.highlightColor
                horizontalAlignment: Label.AlignHCenter
            }

            Label {
                id: deadline
                x: Theme.horizontalPageMargin
                text: "Deadline: " + "15:35"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
            }

            Label {
                id: zone
                x: Theme.horizontalPageMargin
                text: "Zone: " + "Lenina st. 35"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
            }

            Label {
                id: description
                x: Theme.horizontalPageMargin
                text: "Description:"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
            }

            Label {
                id: description_text
                x: Theme.horizontalPageMargin
                width: parent.width
                wrapMode: Text.WordWrap
                text: "Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description "
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium

            }

            Button {
                id: done
                text: "Done!"
                x: Theme.horizontalPageMargin
                onClicked: console.log("clicked!") & pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
                preferredWidth: Theme.buttonWidthLarge
            }


        }

    }
}
