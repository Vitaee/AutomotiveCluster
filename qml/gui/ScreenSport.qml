import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.12
import "../functions.js" as Functions
import ClusterDemo 1.0




Item {
    id: rootSport


    Image {

        id:mask
        source: "qrc:/images/DashboardFrameSport-mask.png"
        focus: true
        Component.onCompleted: {
            forceActiveFocus();
        }

        // Left Gauge
        Item {
            property real speedValue: speedometer.value
            property alias maxValue: speedometer.maxValue
            property color iconRed: "#e41e25"
            property color iconGreen: "#5caa15"
            property color iconYellow: "#face20"
            property color iconDark: "#444444"

            id: speedoItem

            Image {
                property bool animated: true
                property real value: 0
                property real maxValue: 240
                property real outerRadius: Math.min(width, height) * 0.5
                property real maxValueAngle: 90
                property real minValueAngle: -179
                property real degreesPerValue: Math.abs((minValueAngle - maxValueAngle) / speedometer.maximumValue)
                id: speedometer
                x: 47
                y: 62
                width: 383
                height: 390
                source: "qrc:/images/Gauge_Speed.png"
                fillMode: Image.PreserveAspectFit

                Text {
                    id: speedText
                    x: 169
                    y: 117
                    width: 46
                    height: 33
                    text:  speedometer.value.toString()
                    color: "white"
                    font.pixelSize: 32
                }

                Text {
                    x: 163
                    y: 169
                    width: 57
                    height: 31
                    text: qsTr("km/h")
                    color: "white"
                    font.pixelSize: 30
                }

                CircularIndicator {
                    anchors.fill: parent

                    startAngle: speedometer.minValueAngle
                    endAngle: speedometer.maxValueAngle
                    minimumValue: 0
                    maximumValue: speedometer.maxValue
                    value: speedometer.value
                    padding: 13

                    Behavior on value {
                        NumberAnimation { duration: 1000 }

                    }

                    backgroundColor: "transparent"
                    progressColor: "#E31E24"
                }

                CircularIndicator {
                    id: batteryGauge
                    anchors.fill: parent

                    startAngle: 144
                    endAngle: 108
                    minimumValue: 0
                    maximumValue: 100
                    value: 60
                    padding: 12
                    backgroundColor: "transparent"
                    progressColor: "#464749"
                }
            }

            Picture {
                id: fuelWarning
                x: 275
                y: 269
                width: 51
                height: 44
                source: "qrc:/iso-icons/iso_grs_7000_4_0245.dat"


            }
            Colorize {
                id: fuelCalorize
                anchors.fill: fuelWarning
                source: fuelWarning
                hue: 0.0
                saturation: 0.5
                lightness: 0.6
            }

            Picture {
                id: seatBelt
                x: 146
                y: 269
                width: 57
                height: 52
                source: "qrc:/iso-icons/iso_grs_7000_4_0249.dat"
            }

            Colorize {
                id: seatBeltColorize
                anchors.fill: seatBelt
                source: seatBelt
                hue: 0.0
                saturation: 0.5
                lightness: 0.6
            }



        }

        // Right Gauge
        Item {
            id: root

            property bool updateGeometry: false
            property bool showWire: false

            property int rpmValue: 30
            property int maxValue: 90
            property int countOfAnim: 0


            Item {
                Image {
                    id: bg
                    x: 849
                    y: 62
                    width: 383
                    height: 390
                    source: "qrc:/images/Gauge_RPM.png"
                    fillMode: Image.PreserveAspectFit

                    CircularIndicator {



                        id:circularRpm

                        anchors.fill: parent
                        startAngle: -90
                        endAngle: 90
                        minimumValue: 0
                        maximumValue: 8000
                        value: 0
                        padding: 15
                        backgroundColor: "transparent"
                        progressColor: "#E31E24"



                        NumberAnimation on value {
                            id: animationValue

                            from: 0
                            to: 8000
                            loops: Animation.Infinite
                            duration: 3500



                        }

                        onValueChanged: {
                            if (circularRpm.value === 8000 || circularRpm.value > 7990) {


                                root.countOfAnim += 1

                                topText.text = root.countOfAnim.toString();

                                if (parseInt(topText.text) > 5) {
                                    animationValue.stop();

                                }
                            }
                        }
                    }

                   Text {
                        id: topText
                        x: 182
                        y: 136
                        text: "0"
                        color: "white"
                        font.pixelSize: 36
                        }
                    }

                Picture {
                    id: engineTempWarning
                    x: 974
                    y: 262
                    width: 48
                    height: 36
                    source: "qrc:/iso-icons/iso_grs_7000_4_0246.dat"
                    visible: true
                }

                Colorize {
                        id: engineTempWarningColorize
                        anchors.fill: engineTempWarning
                        source: engineTempWarning
                        hue: 0.0
                        saturation: 0.5
                        lightness: 0.6
                        visible: true


                        Behavior on visible {
                            NumberAnimation {
                                duration: 1500
                            }
                        }



                    }


                Picture {
                    id: batteryWarning
                    x: 1057
                    y: 258
                    width: 47
                    height: 40
                    source: "qrc:/iso-icons/iso_grs_7000_4_0247.dat"

                }

                Colorize {
                    id:batteryWarningColorize
                    anchors.fill: batteryWarning
                    source: batteryWarning
                    hue: 0.0
                    saturation: 0.5
                    lightness: 0.6
                }

            }

        }


        // Signal Bar
        Item {
            Picture {
                id: highBeam
                x: 517
                y: 27
                width: 52
                height: 42
                source: "qrc:/iso-icons/iso_grs_7000_4_0083.dat"
                color: "#120ee8"


                ColorAnimation on color {
                    from: "#120ee8"
                    to: "#222324"
                    duration: 1500
                    loops: Animation.Infinite
                }
            }


            Image {
                id: turnLeft
                x: 427
                y: 31
                width: 46
                height: 38
                source: "qrc:/images/Icon_TurnLeft_OFF.png"
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id: turnRight
                x: 799
                y: 32
                width: 59
                height: 37
                source: "qrc:/images/Icon_TurnLeft_OFF.png"
                mirror: true
                fillMode: Image.PreserveAspectFit
            }

            Picture {
                id: brakeWarnSignal
                x: 655
                y: 25
                width: 53
                height: 48
                source: "qrc:/iso-icons/iso_grs_7000_4_0238.dat"
            }
            Colorize {
                id: brakeWarningColorize
                anchors.fill: brakeWarnSignal
                source: brakeWarnSignal
                hue: 0.0
                saturation: 0.5
                lightness: 0.6
            }

            Picture {
                id: lowBeam
                x: 590
                y: 27
                width: 53
                height: 44
                source: "qrc:/iso-icons/iso_grs_7000_4_0456.dat"


                ColorAnimation on color {
                    from: "#0d9e1b"
                    to: "#222324"
                    duration: 2000
                    loops: Animation.Infinite
                }
            }


            Picture {
                id: engineFailure
                x: 719
                y: 28
                width: 44
                height: 45
                source: "qrc:/iso-icons/iso_grs_7000_4_0248.dat"
                rotation: 0.018
            }
            Colorize {
                id: engineFailureColorize
                anchors.fill: engineFailure
                source: engineFailure
                hue: 0.0
                saturation: 0.5
                lightness: 0.6
            }

        }


        // MusicPlayer
        Item {
            property real xCenter: remainingTimeImage.width / 2
            property real yCenter: remainingTimeImage.height / 2
            property int timeElapsed: musicElapsed

            property real backCut: 0 //For needle tail gradient
            property real musicElapsed: 0

            property bool musicEnabled: false
            id: playerView
            visible: musicEnabled


            Image {
                id: musicCover
                x: 577
                y: 178
                width: 131
                height: 124
                source: "qrc:/images/MusicPlayer_Cover.png"
                fillMode: Image.PreserveAspectFit
                visible: playerView.musicEnabled
            }

            Image {
                id: remainingTimeImage
                anchors.centerIn: musicCover
                source: "qrc:/images/MusicPlayer_CircleRemaining.png"
                visible: playerView.musicEnabled
            }

            Text {
                id: text3
                x: 582
                y: 316
                text: "Tonight's the Night\n (Gonna Be Alrigth)\n ROD STEWART"
                color: "white"
                font.pixelSize: 14
                visible: playerView.musicEnabled
            }


            function paintBackground(ctx) {

                ctx.beginPath()
                ctx.lineWidth = 3
                ctx.strokeStyle = "red"

                ctx.arc(playerView.xCenter, playerView.yCenter, playerView.yCenter - ctx.lineWidth / 2, 1.5 * Math.PI, 2 * Math.PI * playerView.timeElapsed / 100 + 1.5 * Math.PI)
                ctx.stroke()
            }
            Canvas {
                id: canvas
                width: remainingTimeImage.width
                height: width
                anchors.centerIn: musicCover
                onPaint: {

                    var ctx = getContext("2d")

                    ctx.reset()


                    playerView.paintBackground(ctx)


                }
            }
            onTimeElapsedChanged: {
                canvas.requestPaint()
            }

            //Do not play music timer if view not visible
            Component.onCompleted: playerView.musicEnabled ? musicTimer.running = true : musicTimer.running = false
            onVisibleChanged: {
                if (playerView.musicEnabled) {
                    musicTimer.running = true;
                }else
                    musicTimer.running = false
            }

            Timer {
                id: musicTimer
                interval: 2000
                running: false
                repeat: true
                onTriggered: {

                    if (playerView.musicElapsed < 100) {
                    playerView.musicElapsed++;

                    } else {
                        playerView.musicElapsed = 0
                    }


                }
            }

        }

        // Car Body
        CarBody {
            id: carBody
            visible: false
        }

        // Mini Map
        NavigationMap {
           id: mapId
           visible: true
           x: 465
           y: 100

        }


        // Footer
        Footer {

        }

        Keys.onPressed: {
            if (event.key === Qt.Key_2){
                checkVisibles("brakeWarningColorize")

            }

            if (event.key === Qt.Key_4){
                changeSignals("left")
            }

            if (event.key === Qt.Key_5){
                checkVisibles("engineFailureColorize")
            }

            if (event.key === Qt.Key_6){
                changeSignals("right")
            }

            if (event.key === Qt.Key_W){
                //var x =  speedometer.value
                //var a = x += 1

                if (speedometer.value > 239){
                    speedometer.value = 240
                    speedText.text = "240"

                }
                else {
                    speedometer.value += 1;
                    //speedText.text = a.toString();

                }
            }


            if (event.key === Qt.Key_F1){
                checkVisibles("fuelColorize")
            }

            if (event.key === Qt.Key_F2){
                checkVisibles("seatBeltColorize")
            }

            if (event.key === Qt.Key_F3){
                checkVisibles("engineTempWarningColorize");
            }

            if (event.key === Qt.Key_F4) {
                checkVisibles("batteryWarningColorize")
            }


            if (event.key === Qt.Key_Enter){


                 if (playerView.visible) {
                     musicOpacity.running = true;
                } else if (carBody.visible) {
                    carBody.visible = false;
                    mapId.visible = true;
                } else {
                     mapOpacity.running = true;
                    playerView.musicEnabled = true;
                    playerView.visible = true;

                 }


            }


         

        }

        Keys.onReleased: {

           if (!event.isAutoRepeat) {

              if (event.key === Qt.Key_W){
                        //speedometer.value = 0
                        //speedText.text = "0"
                        decreaseNeedle(speedometer.value)
                 }

                }

        }


        // handle signal warnings
        function changeSignals(process){
                if (process === "left"){
                    if (turnLeft.source.toString() === "qrc:/images/Icon_TurnLeft_ON.png" ) {
                        turnLeft.source = "qrc:/images/Icon_TurnLeft_OFF.png"
                    } else {
                         turnLeft.source = "qrc:/images/Icon_TurnLeft_ON.png";
                    }

                } else if (process === "right") {
                    if (turnRight.source.toString() === "qrc:/images/Icon_TurnLeft_ON.png") {
                        turnRight.source = "qrc:/images/Icon_TurnLeft_OFF.png"
                    } else {
                        turnRight.source = "qrc:/images/Icon_TurnLeft_ON.png"
                    }
                }

        }

        // handle visible of icons
        function checkVisibles(iconName){
            if (iconName === "engineTempWarningColorize"){
                if (engineTempWarningColorize.visible === true) {
                    engineTempWarningColorize.visible = false;
                } else {
                    engineTempWarningColorize.visible = true;
                }
            }
            if (iconName === "batteryWarningColorize"){
                if (batteryWarningColorize.visible === true) {
                    batteryWarningColorize.visible = false;
                } else {
                    batteryWarningColorize.visible = true;
                }
            }
            if (iconName === "fuelColorize"){
                if (fuelCalorize.visible === true) {
                    fuelCalorize.visible = false;
                } else {
                    fuelCalorize.visible = true;
                }
            }
            if (iconName === "seatBeltColorize"){
                if (seatBeltColorize.visible === true) {
                    seatBeltColorize.visible = false;
                } else {
                    seatBeltColorize.visible = true;
                }
            }

            if (iconName === "brakeWarningColorize") {
                if (brakeWarningColorize.visible === true) {
                    brakeWarningColorize.visible = false;
                } else {
                    brakeWarningColorize.visible = true;
                }

            }
            if (iconName === "engineFailureColorize") {
                if (engineFailureColorize.visible === true) {
                    engineFailureColorize.visible = false;
                } else {
                    engineFailureColorize.visible = true;
                }

            }
        }

        // decreasing needle
        function decreaseNeedle(value){
                speedText.text = "0"

            for (value <= 0; value--;){
                speedometer.value = value;
            }

        }


    }

   


    OpacityAnimator {
        id:screenChargeAnim
        target: chargeScreenLoader
        from: chargeScreenLoader.opacity
        to: 1.0
        duration: 250
    }

    OpacityAnimator {
        id: mapOpacity
        target: mapId
        from: 1
        to: 0.1
        duration: 1500
        running: false
        onStopped: {
            mapId.visible = false;
            mapId.opacity = 1

        }
    }

    OpacityAnimator {
        id: musicOpacity
        target: playerView
        from: 1
        to: 0.1
        duration: 1500
        running: false
        onStopped: {
            playerView.musicEnabled = false;
            playerView.visible = false;
            carBody.visible = true;
            playerView.opacity = 1

        }

    }
}



