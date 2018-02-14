import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    property double anglePerPixel: 180 / mainWindow.width
    property bool enableOuterText: true
    property bool enableInnerText: true

    id: mainWindow
    visible: true
    width: 1000
    height: 454
    maximumHeight: height
    minimumHeight: height
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    title: qsTr("Valentine's Gift")
    color: "transparent"

    Image {
        id: imgMove
        anchors.right: parent.right
        height: parent.height
        source: "/res/heartImage.png"
        fillMode: Image.PreserveAspectFit
        z: 100

        MemeText {
            id: memeTop
            text: "YOU SAID"
            anchors.top: imgMove.top
            anchors.topMargin: 20
            visible: mainWindow.enableOuterText
        }

        MemeText {
            id: memeBot
            text: "YOU WANTED A CARD"
            anchors.bottom: imgMove.bottom
            anchors.bottomMargin: 20
            visible: mainWindow.enableOuterText
        }

        transform: Rotation {
            id: t1
            origin.x: 0
            origin.y: imgMove.height / 2
            axis {
                x: 0
                y: 1
                z: 0
            }
            angle: 0
        }
    }

    Image {
        id: imgStationary
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height
        source: "/res/barbossa.png"
        fillMode: Image.PreserveAspectFit
        z: 0

        MemeText {
            id: memeInnerTop
            text: "BUT FAILED TO SPECIFY"
            anchors.top: imgStationary.top
            anchors.topMargin: 20
            visible: mainWindow.enableInnerText
        }

        MemeText {
            id: memeInnerBot
            text: "WHAT FORMAT"
            anchors.bottom: imgStationary.bottom
            anchors.bottomMargin: 20
            visible: mainWindow.enableInnerText
        }
    }

    MouseArea {
        anchors.fill: parent
        onMouseXChanged: {
            if (mouseX >= 0 && mouseX <= mainWindow.width) {
                t1.angle = (mouseX - mainWindow.width) * mainWindow.anglePerPixel
                mainWindow.enableOuterText = (t1.angle > -90)
                mainWindow.enableInnerText = !mainWindow.enableOuterText
            }
        }

        onDoubleClicked: mainWindow.close()
    }
}
