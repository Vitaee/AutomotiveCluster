import QtQuick 2.0

Image {
    property int visibleIfChargeMoreThan: 0
    property int visibleIfChargeLessThan: 101
    property int animateIfChargeMoreThan: visibleIfChargeMoreThan
    property int animateIfChargeLessThan: 101
    property bool animationRunning: true
    property int charge: globalData.countCharge

    visible: {
        visibleIfChargeMoreThan < charge && charge < visibleIfChargeLessThan ? true : false;
    }

    SequentialAnimation on opacity {

    NumberAnimation { from:1; to:0.3; duration: 1500; easing.type: Easing.InOutQuad }
    NumberAnimation { from:0.3; to:1; duration: 1500; easing.type: Easing.InQuad }

    PauseAnimation { duration: 1000 }

    loops: Animation.Infinite

    running: {
        function properlyEndAnimation() {
         if (opacity != 1){
             mAnimationFinisher.running = true;
         }
        }

        if (!animationRunning){
            properlyEndAnimation();
            return false;
        }

        if (animateIfChargeMoreThan < charge && charge < animateIfChargeLessThan ){
            return true;
        }

        properlyEndAnimation();
        return false;
    }

    }

    NumberAnimation on opacity {
        id: mAnimationFinisher
        to: 1.0
        duration: 500
    }




}
