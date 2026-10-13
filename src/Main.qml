import QtQuick
import QtQuick.Shapes
import QtQuick.Controls
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

        videoId: "1fJQCPMd8pc"
    }
    Image {
        anchors.centerIn: parent
        anchors.fill: parent
        asynchronous: true
        clip: true
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/qt/qml/Main/assets/blur_full_green_energy.jpg"

        ScrollView {
            anchors.fill: parent
            contentHeight: 1000

            Zonai {
                id: zonai

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -(0.015 * width + 0.5)
                anchors.top: parent.top
                color: "#ffcbb687"
                height: width
                width: 350

                NumberAnimation on anchors.topMargin {
                    duration: 1000
                    easing.type: Easing.OutCubic
                    from: -325
                    to: -30
                }
                NumberAnimation on opacity {
                    duration: 1100
                    easing.type: Easing.OutCubic
                    from: 0
                    to: 1
                }
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: zonai.bottom
                color: "#ffcbb687"
                font.bold: true
                font.family: fontbd.name
                font.pointSize: 30
                text: "“VERITAS DOMINVS MEVS EST”"

                NumberAnimation on anchors.topMargin {
                    duration: 1000
                    easing.type: Easing.OutCubic
                    from: -400
                    to: 0
                }
                NumberAnimation on opacity {
                    duration: 1100
                    easing.type: Easing.OutCubic
                    from: 0
                    to: 1
                }
            }
        }
    }
}
