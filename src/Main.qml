import QtQuick
import QtQuick.Shapes
import QtQuick.Controls
import QtMultimedia
import Music

Window {
    visible: true

    FontLoader {
        id: font

        source: "qrc:/qt/qml/Main/assets/times.ttf"
    }
    FontLoader {
        id: fontbd

        source: "qrc:/qt/qml/Main/assets/timesbd.ttf"
    }
    Music {
        id: music

        videoId: "y6lfK3bH4z8"
    }
    MediaPlayer {
        id: player

        source: music.url
        videoOutput: video
    }
    Image {
        id: bg

        anchors.centerIn: parent
        anchors.fill: parent
        asynchronous: true
        clip: true
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/qt/qml/Main/assets/blur_full_green_energy.jpg"

        ScrollView {
            anchors.centerIn: parent
            anchors.fill: parent

            ScrollBar.vertical: ScrollBar {
                active: false
            }

            Flickable {
                anchors.centerIn: parent
                anchors.fill: parent
                boundsMovement: Flickable.StopAtBounds
                contentHeight: zonai.height + title.height + musicPlayer.height - 30

                Zonai {
                    id: zonai

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -(0.015 * width + 0.5)
                    anchors.top: parent.top
                    color: "#ffcbb687"
                    height: width
                    width: parent.width <= 350 ? parent.width - 10 : 350

                    NumberAnimation on anchors.topMargin {
                        duration: 1000
                        easing.type: Easing.OutQuart
                        from: -325
                        to: -30
                    }
                    NumberAnimation on opacity {
                        duration: 1500
                        easing.type: Easing.OutCubic
                        from: 0
                        to: 1
                    }
                }
                Text {
                    id: title

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: zonai.bottom
                    color: "#ffcbb687"
                    font.bold: true
                    font.family: fontbd.name
                    font.pointSize: 30
                    fontSizeMode: Text.HorizontalFit
                    horizontalAlignment: Text.AlignHCenter
                    text: "“VERITAS DOMINVS MEVS EST”"
                    width: parent.width - 20

                    NumberAnimation on anchors.topMargin {
                        duration: 1000
                        easing.type: Easing.OutQuart
                        from: -400
                        to: 0
                    }
                    NumberAnimation on opacity {
                        duration: 1500
                        easing.type: Easing.OutCubic
                        from: 0
                        to: 1
                    }
                }
                Rectangle {
                    id: musicPlayer
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: title.bottom
                    color: "black"
                    height: width / 4
                    radius: 30
                    width: parent.width <= 700 ? parent.width - 20 : 700

                    NumberAnimation on anchors.topMargin {
                        duration: 1000
                        easing.type: Easing.OutQuart
                        from: 0
                        to: 20
                    }
                    NumberAnimation on opacity {
                        duration: 1500
                        easing.type: Easing.OutCubic
                        from: 0
                        to: 1
                    }

                    VideoOutput {
                        id: video

                        anchors.fill: parent
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: player.play()
                    }
                }
            }
        }
    }
}
