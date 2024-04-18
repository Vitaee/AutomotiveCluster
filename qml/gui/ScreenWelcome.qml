import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    width: rootBg.width
    height: rootBg.height


    Loader {
        id: welcomeLoader
    }


    Image {
        id: rootBg
        width: 1280
        height: 480
        source: "qrc:/images/car_bg"
        opacity: 0.1
        z: -1
    }


    Timer {
            id: timer
        }


    function delay(delayTime, cb) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
        }

    OpacityAnimator {
            target: rootBg;
            from: rootBg.opacity
            to: 1;
            duration: 2000

            running: true
            onStopped: {

                delay(2000, function() {
                welcomeLoader.setSource("ScreenSport.qml")
                rootBg.visible = false;
                welcomeText.visible = false;
                    footerId.visible = false;


                    })
            }
        }


    Text {
        id: welcomeText
        x: 600
        y: 185
        text: qsTr("Welcome..")
        font.pixelSize: 18
    }

  

    OpacityAnimator {
        target: footerId
        from: 0.1
        to: 1
        duration: 1000
        running: true
    }





}
