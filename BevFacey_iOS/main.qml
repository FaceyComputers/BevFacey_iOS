import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")



    Rectangle{
        id: test;
        x: 0
        y: 0
        width: parent.width;
        height: 100;
        color: "#004D85";
    }

    Text {
        id: text1
        anchors.centerIn: parent;
        y: 20
        width: 63
        height: 61
        color: "#FFC412";
        text: qsTr("Bev Facey Community High School")
        anchors.verticalCenterOffset: -177
        anchors.horizontalCenterOffset: -90
        renderType: Text.QtRendering
        font.pixelSize: 20
    }

}
