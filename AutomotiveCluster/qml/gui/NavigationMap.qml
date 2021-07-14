import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6
//import Felgo 3.0

/*Rectangle {
    width: 360
    height: 260
    border.color: "transparent"
    border.width: 5
    radius: 10


    AppMap {
       id: appMap

       anchors.fill: parent

       // configure map provider
       plugin: mapboxPlugin

       //Route visualization item
       MapRoute {
         id: routeItem
         opacity: 0.6
         smooth: true
         antialiasing: true
         visible: false
         line {
           color: "cornflowerblue"
           width: 5
         }
       }

       MapQuickItem {
         id: startMarker
         visible: false
         anchorPoint {
           x: sourceItem.width / 2
           y: sourceItem.height
         }

         //Item used as graphic
           sourceItem: Icon {
             icon: IconType.mapmarker
             color: "red"
             size: dp(30)
           }
       }

       MapQuickItem {
         id: destinationMarker
         visible: false
         anchorPoint {
           x: sourceItem.width / 2
           y: sourceItem.height
         }

         //Item used as graphic
           sourceItem: Icon {
             icon: IconType.mapmarker
             color: "red"
             size: dp(30)
           }
       }

       MouseArea {
         property bool isSettingStartMarker: true
         anchors.fill: parent
         enabled: routeModel.status !== RouteModel.Loading

         onPressAndHold: {
           var coordinates = appMap.toCoordinate(Qt.point(mouse.x, mouse.y))
           if(isSettingStartMarker) {
             routeQuery.addWaypoint(coordinates)
             startMarker.coordinate = coordinates
             startMarker.visible = true

             //Hiding old route
             destinationMarker.visible = false
             routeItem.visible = false
             routeModel.reset()
             isSettingStartMarker = false
           }
           else {
             routeQuery.addWaypoint(coordinates)
             destinationMarker.coordinate = coordinates
             destinationMarker.visible = true
             isSettingStartMarker = true
           }


           // If start and destination marker are set
           // the route model need to be updated

           if(routeQuery.waypoints.length >= 2){
             routeQuery.travelModes = RouteQuery.CarTravel
             routeModel.update()
           }
         }
       }
     }

     Plugin {
       id: mapboxPlugin
       name: "mapbox"
       // configure your own map_id and access_token here
       // parameters: [
       //  PluginParameter {
       //    name: "mapbox.mapping.map_id"
       //    value: "mapbox.streets"
       //  },
       //  PluginParameter {
       //    name: "mapbox.access_token"
       //    value: "pk.eyJ1IjoiZ3R2cGxheSIsImEiOiJjaWZ0Y2pkM2cwMXZqdWVsenJhcGZ3ZDl5In0.6xMVtyc0CkYNYup76iMVNQ"
       //  }
       // ]
     }

     RouteModel {
       id: routeModel
       plugin: mapboxPlugin
       autoUpdate: false
       query: routeQuery

       onStatusChanged: {
         //When model found a route pass show it
         if(status == RouteModel.Ready) {
           routeItem.route = get(0)
           //passing info about route length
           routeLengthLabel.routeLength = get(0).distance
           routeItem.visible = true

           //Clear old route query
           routeQuery.clearWaypoints()
         }
       }
     }

     RouteQuery {
       id: routeQuery
     }

     AppText {
       property real routeLength: 0

       id: routeLengthLabel
       width: parent.width * 0.8
       visible: routeItem.visible
       anchors {
         bottom: parent.bottom
         horizontalCenter: parent.horizontalCenter
         bottomMargin: dp(20)
       }
       fontSize: 14
       clip: true
       //Displaying route length converted from m to km
       text: qsTr("Route length ") + (routeLength/1000).toFixed(1) + "km"
     }

     AppActivityIndicator {
       id: busyIndicator
       anchors.centerIn: parent
       visible: routeModel.status === RouteModel.Loading
     }
}*/

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
