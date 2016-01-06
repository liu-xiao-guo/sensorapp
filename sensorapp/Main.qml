import QtQuick 2.0
import Ubuntu.Components 1.1
import Sensorapp 1.0
import "QuickPlot"

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "sensorapp.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(85)

    Page {
        title: i18n.tr("Sensor App")

        Rectangle {
            anchors.fill: parent

            PlotArea {
                id: plotArea
                anchors.fill: parent

                yScaleEngine: FixedScaleEngine {
                    max: 1.5
                    min: -1.5
                }

                items: [
                    ScrollingCurve {
                        id: meter;
                        numPoints: 300
                    }
                ]
            }

            Timer {
                id: timer;
                interval: 20;
                repeat: true;
                running: true;

                property real pos: 0

                onTriggered: {
                    meter.appendDataPoint( Math.sin(pos) );
                    pos += 0.05;
                }
            }
        }
    }

}

