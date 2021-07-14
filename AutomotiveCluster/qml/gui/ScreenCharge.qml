import QtQuick 2.9

Item {

    property int chargeValue: globalData.countCharge

    id: chargeRoot
    focus: true
    Component.onCompleted: {
        forceActiveFocus();
    }

    Image {
        id: background
        source: "qrc:/images/bg_charge.jpg"




        Text {
            id: text1
            x: 1058
            y: 18
            text: "Charge: %"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            id: chargeCount
            x: 1143
            y: 18
            text: "15"
            font.pixelSize: 18
            color: "white"
        }


    }

    Image {
        id:battery
        x: 435
        y: -140 // -120 centered
        source: "qrc:/images/battery.png"
        height: background.height
        rotation: 90

        ChargeBlock {
            id: chargeBlock1
            x: 28
            y: 553
            width: 356
            height: 132
            source: "qrc:/images/battery_label.png"
            fillMode: Image.PreserveAspectFit
            visibleIfChargeMoreThan: -1
            animateIfChargeLessThan: 21

        }

        ChargeBlock {
            id: chargeBlock2
            x: 28
            y: 422
            width: 356
            height: 132
            source: "qrc:/images/battery_label.png"
            fillMode: Image.PreserveAspectFit
            visibleIfChargeMoreThan: 20
            animateIfChargeLessThan: 41
        }

        ChargeBlock {
            id: chargeBlock3
            x: 28
            y: 294
            width: 356
            height: 132
            source: "qrc:/images/battery_label.png"
            fillMode: Image.PreserveAspectFit
            visibleIfChargeMoreThan: 40
            animateIfChargeLessThan: 61
        }

        ChargeBlock {
            id: chargeBlock4
            x: 28
            y: 163
            width: 356
            height: 132
            source: "qrc:/images/battery_label.png"
            fillMode: Image.PreserveAspectFit
            visibleIfChargeMoreThan: 60
            animateIfChargeLessThan: 81
        }

        ChargeBlock {
            id: chargeBlock5
            x: 28
            y: 78
            width: 356
            height: 132
            source: "qrc:/images/battery_label.png"
            fillMode: Image.PreserveAspectFit
            visibleIfChargeMoreThan: 80
            animateIfChargeLessThan: 100
        }
    }





    Footer {
        id: footerId
        x: 372
        y: 440
        color: "transparent"

    }

    OpacityAnimator {
        target: background
        from: 0.1
        to: 1.0
        duration: 2500
        running: true
    }



    Keys.onPressed: {

        if(event.key === Qt.Key_A){
            handeCharge("-", globalData.countCharge)

        }

        if (event.key === Qt.Key_D){
            handeCharge("+", globalData.countCharge)
        }
    }


    function handeCharge(process, currentCharge){

        if(process === "+"){
            if(currentCharge >= 0 && currentCharge <= 20){

                    globalData.countCharge = 30

                    chargeCount.text = globalData.countCharge.toString();

            } else if(currentCharge >= 21 && currentCharge <= 40){
                globalData.countCharge = 55

                chargeCount.text = globalData.countCharge.toString();

            } else if (currentCharge >= 41 && currentCharge <= 60) {
                globalData.countCharge = 70

                chargeCount.text = globalData.countCharge.toString();

            } else if (currentCharge >= 61 && currentCharge <= 80) {
                globalData.countCharge = 85

                chargeCount.text = globalData.countCharge.toString();
            } else if (currentCharge >= 81 && currentCharge <= 101) {
                globalData.countCharge = 100

                chargeCount.text = globalData.countCharge.toString();

            }


        } else {

            if (currentCharge >= 80 && currentCharge <= 100){

                globalData.countCharge = 75
                chargeCount.text = globalData.countCharge.toString();

            } else if (currentCharge >= 61 && currentCharge <= 79){
                globalData.countCharge = 59
                chargeCount.text = globalData.countCharge.toString();

            } else if (currentCharge >= 41 && currentCharge <= 60){
                globalData.countCharge = 39
                chargeCount.text = globalData.countCharge.toString();

            } else if (currentCharge >= 21 && currentCharge <= 40){
                globalData.countCharge = 15
                chargeCount.text = globalData.countCharge.toString();

            }

        }
    }





}
