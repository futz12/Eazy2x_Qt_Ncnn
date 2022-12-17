import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 480
    height: 800
    title: "Eazy2x"

    SwipeView {
        id: swipeView
        anchors.fill: parent

        currentIndex: 0

        interactive: false;//禁止手拖动

        Label {//home
            id: firstPage
            text: "firstPage"

            Image {
                id: image
                anchors.fill: parent
                fillMode: Image.Tile
                source: "675a7689568454921fa35a8a8b67241f.jpg"


            }

            Text {
                id: element
                text: qsTr("Eazy2x")
                anchors.right: parent.right
                anchors.rightMargin: 137
                anchors.left: parent.left
                anchors.leftMargin: 127
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 657
                anchors.top: parent.top
                anchors.topMargin: 71
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 72
            }

            Button {
                id: button
                x: 185
                y: 264
                text: qsTr("处理视频")
                anchors.bottom: button1.top
                anchors.bottomMargin: 76
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: button1
                x: 186
                y: 380
                text: qsTr("处理图片")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: button2
                x: 175
                y: 509
                text: qsTr("设备信息")
                anchors.top: button1.bottom
                anchors.topMargin: 76
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    swipeView.currentIndex=1;
                    ui.about();

                }
            }
        }


        Label {//device
            id: secondPage
            text: "secondPage"

            Image {
                id: image1
                anchors.fill: parent
                source: "675a7689568454921fa35a8a8b67241f.jpg"
                fillMode: Image.Tile
            }

            Text {
                id: element1
                width: 176
                height: 56
                text: qsTr("设备信息")
                anchors.left: parent.left
                anchors.leftMargin: 22
                anchors.top: parent.top
                anchors.topMargin: 30
                font.pixelSize: 44
            }

            ListView {
                id: listView
                x: 38
                y: 169
                width: 423
                height: 269
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: -85
                anchors.verticalCenter: parent.verticalCenter
                highlightRangeMode: ListView.NoHighlightRange
                cacheBuffer: 320
                keyNavigationWraps: false
                orientation: ListView.Vertical
                snapMode: ListView.NoSnap
                interactive: true
                flickableDirection: Flickable.VerticalFlick
                model: ListModel {
                }
                delegate: Item {
                    x: 5
                    width: 80
                    height: 40
                    Row {
                        id: row1
                        Rectangle {
                            width: 40
                            height: 40
                            color: colorCode
                        }

                        Text {
                            text: name
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                        }
                        spacing: 10
                    }
                }
            }
        }
    }


    Label
    {
        objectName: 'myfunc'
        function insert2list(text)
        {
            listView.model.append({name: text,colorCode: "green"});
        }

    }
}








/*##^##
Designer {
    D{i:10;anchors_x:22;anchors_y:42}D{i:11;anchors_y:169}
}
##^##*/
