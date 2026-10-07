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
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            color: "#ffcbb687"
            scale: 0.9
        }
    }
}
