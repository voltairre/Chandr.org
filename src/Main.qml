import QtQuick
import QtQuick.Shapes

Window {
    visible: true

    Image {
        source: "qrc:/qt/qml/website/assets/blur_full_green_energy.jpg"
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
        clip: true
        anchors.centerIn: parent
        anchors.fill: parent

        Zonai {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 10
            anchors.leftMargin: parent.width/2 - 140
            scale: 0.2
            color: "#ffcbb687"
        }
    }
}
