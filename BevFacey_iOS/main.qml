import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    visible: true
    width: 375 //Fits 375 - iPhone 6 - 7, 320 - iPhone 5 - 5s
    height: 620
    title: qsTr("Bev Facey App")

    FontLoader
    {
    id: eras;
    source: "https://raw.githubusercontent.com/jmyrland/DriSMo/master/drismo/assets/eras-bold.ttf";
    }

    Rectangle
    {
        id: test;
        x: 0
        y: -47
        width: parent.width;
        height: parent.height / 5
        color: "#004D85";
    }

    Text
    {
        id: text1
        font.family: eras.name;
        x: 6
        //anchors.centerIn: parent;
        y: 6
        width: 469
        height: 71
        color: "#FFFFFF";
        text: qsTr("Bev Facey\nCommunity High School")
        font.capitalization: Font.MixedCase
        //anchors.verticalCenterOffset: 0
        //anchors.horizontalCenterOffset: 0
        renderType: Text.QtRendering
        font.pixelSize: {
            if(Screen.width == 320)
            {
            20
            }else if(Screen.width == 375){
            30
            }
        }
    }

    Text {
        id: text2
        x: 144
        y: 184
        text: Screen.width + " " + Screen.height;
        font.pixelSize: 12
    }

}
