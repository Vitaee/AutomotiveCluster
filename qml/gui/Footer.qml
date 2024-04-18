import QtQuick 2.9

 Rectangle {
        id: rectangle
        x: 373
        y: 392
        width: 536
        height: 36
        color: "#000000"

        Text {
            id: clock
            x: 64
            y: 8
            color: "white"
            text: "00:00"
            font.pixelSize: 14
        }

        Text {
            id: dateInfo
            x: 168
            y: 8
            text: "00.00"
            color: "white"
            font.pixelSize: 14
        }

        Text {
            id: temp
            x: 377
            y: 8
            text: "23°"
            color: "white"
            font.pixelSize: 14
        }

        Text {
            id: tempValue
            x: 415
            y: 8
            width: 39
            height: 17
            text: "Windy"
            color: "white"
            font.pixelSize: 14
        }

        Timer {
               interval: 500
               running: true
               repeat: true

               onTriggered: {
                   let date = new Date()
                   clock.text = date.toLocaleTimeString(Qt.locale("tr_TR"), "HH:mm:ss")
                   dateInfo.text = date.toLocaleDateString(Qt.locale("en_EN"))

               }
        }

    }




