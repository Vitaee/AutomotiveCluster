import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Extras 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.12

import "functions.js" as Functions
import ClusterDemo 1.0

Window {
    id: rootScreen
    width: 1280
    height: 480
    title: qsTr("HMI Cluster")
    visible: true
    color: "#000000"

    Loader { id: rootLoader }

    Component.onCompleted: {  rootLoader.setSource("qrc:/gui/Motorama.qml") }

}
