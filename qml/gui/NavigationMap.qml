import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6

Rectangle {

    width: 360
    height: 260
    border.color: "transparent"
    border.width: 5
    radius: 10



    Plugin {
        id: mapPlugin
        name: "mapboxgl" // "osm", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(35.22, 33.32)
        zoomLevel: 12
    }

}
