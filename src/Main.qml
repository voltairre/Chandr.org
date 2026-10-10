import QtQuick
import QtQuick.Shapes
import Music

Window {
    visible: true

    Music{}
    Image {
        source: "qrc:/qt/qml/Main/assets/blur_full_green_energy.jpg"
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
        clip: true
        anchors.centerIn: parent
        anchors.fill: parent

        Zonai {
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffcbb687"
            scale: 0.8
        }
    }
}
