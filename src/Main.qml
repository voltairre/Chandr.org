import QtQuick
import QtQuick.Shapes
import Music

Window {
    visible: true

    FontLoader {
        id: font
        source: "qrc:/qt/qml/Main/assets/times.ttf"
    }

    Music{
        id: music
        videoId: "1fJQCPMd8pc"
    }

    Image {
        source: "qrc:/qt/qml/Main/assets/blur_full_green_energy.jpg"
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
        clip: true
        anchors.centerIn: parent
        anchors.fill: parent

        Zonai {
            id: zonai
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -(0.015 * width + 0.5)
            color: "#ffcbb687"
            width: 350
            height: width
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: zonai.bottom
            anchors.topMargin: 30
            text: "Hello"
            font.family: font.name
            font.pointSize: 50
            color: "#ffcbb687"
        }

        Rectangle {
            height: parent.height
            width: 1
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
