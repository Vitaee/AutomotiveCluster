import QtQuick 2.9
import QtQuick.Extras 1.4
import QtQuick.Controls 2.0


Item {
    //id: carBody
    //visible: !playerView.musicEnabled
    Image {
        id: car
        x: 555
        y: 120
        width: 140
        height: 211
        source: "qrc:/images/car_body.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierLeftFront
        x: 547
        y: 154
        width: 45
        height: 43
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierLeftBack
        x: 547
        y: 283
        width: 45
        height: 43
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierRightBack
        x: 660
        y: 283
        width: 45
        height: 43
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: tierRightFront
        x: 660
        y: 154
        width: 45
        height: 43
        source: "qrc:/images/car_tier.png"
        fillMode: Image.PreserveAspectFit

    }

    OpacityAnimator {
            target: tierRightFront;
            from: 0.2;
            to: 1;
            duration: 2000
            loops: Animation.Infinite
            running: true
        }

    Text {
        id: text1
        x: 504
        y: 298
        color: "white"
        width: 45
        height: 28
        text: qsTr("30 psi")
        font.pixelSize: 12
    }

    Text {
        id: text2
        x: 504
        y: 163
        color: "white"
        width: 45
        height: 28
        text: qsTr("30 psi")
        font.pixelSize: 12
    }

    Text {
        id: tierRightBackText
        x: 715
        y: 298
        color: "white"
        width: 45
        height: 28
        text: qsTr("34 psi")
        font.pixelSize: 12
    }

    Text {
        id: tierRightFrontText
        x: 715
        y: 169
        width: 45
        height: 28
        text: "45 psi"
        font.pixelSize: 12
        color: {
            if (tierRightFrontText.text.split(" ")[0] === "45"){
                tierRightFrontText.opacity = 0.2
                return "red"
            } else {
                tierRightFrontText.opacity = 1.0
                return "white"
            }
        }

    }

    OpacityAnimator {
            target: tierRightFrontText
            from: tierRightFrontText.opacity
            to: 1.0
            duration: 2000
            loops: Animation.Infinite
            running: tierRightFrontText.opacity == 1.0 ? false : true
    }


}

