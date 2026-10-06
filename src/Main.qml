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

        CoatOfArms {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 10
            scale: 1.0
            //color: "#ffcbb687"
        }
    }
}
