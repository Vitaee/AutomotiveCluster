import QtQuick 2.2
import QtMultimedia 5.0
import QtQuick.Controls 2.12

Item {

    id: motoramaRoot
    property string currentScreen: null
    property bool isHangOnState: false
    property bool isPowerOff: false
    property bool driveEnabled: false
    property bool chargeEnabled: false




    focus: true
    Keys.onPressed: {
        if (event.key === Qt.Key_Space){
            motoramaRoot.driveEnabled = true;

        }
    }

    Component.onCompleted: {

        changeCurrentScreen('ScreenWelcome.qml');
        motoramaRoot.forceActiveFocus();
    }

    Connections {
        target: motoramaRoot
        onIsPowerOffChanged:{
            if(isPowerOff) powerOff();

        }
        onDriveEnabledChanged:{
            checkAndUpdateScreen();
        }
        onChargeEnabledChanged:{
            checkAndUpdateScreen();
        }
    }

    function checkAndUpdateScreen(){
        if (chargeEnabled){
            isHangOnState = false;
            changeCurrentScreen('ScreenCharge.qml');
        } else if (driveEnabled){
            isHangOnState = false;
            changeCurrentScreen('ScreenSport.qml');
        } else {
            isHangOnState = true;
            if (currentScreen != 'ScreenWelcome.qml'){
                goScreenInactiveAnim.running = true;
            }
        }
    }

    function changeCurrentScreen(qmlSource){
        if (screenTransitionAnim.running || screenOpenAnimation.running) return;
        if (currentScreen === qmlSource) {
            goScreenActiveAnim.running = true;
            return;
        }

        currentScreen = qmlSource;
        screenTransitionAnim.running = true;
        //screenLoader.setSource('ScreenSport.qml')
    }

    function powerOff(){
        Qt.callLater(Qt.quit);
    }


    OpacityAnimator {
        id: goScreenInactiveAnim
        target: screenLoader
        from: screenLoader.opacity
        to: 0.4
        duration: 250
    }


    OpacityAnimator{
        id: goScreenActiveAnim
        target: screenLoader
        from: screenLoader.opacity
        to: 1.0
        duration: 250
    }

    OpacityAnimator{
        id: screenTransitionAnim
        target: screenLoader
        from: screenLoader.opacity
        to: 0.0
        duration: 500
        onStopped: {
            screenLoader.setSource(currentScreen);
            screenOpenAnimation.running = true;
        }
    }

    OpacityAnimator {
        id: screenOpenAnimation
        target: screenLoader
        from: screenLoader.opacity
        to: 1.0
        duration: 400
        onStopped: {
            checkAndUpdateScreen();
        }

    }

    Loader {
        id:screenLoader
    }






}
