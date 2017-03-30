import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

ApplicationWindow {

    function getWidth() //Fits 375 - iPhone 6 - 7, 320 - iPhone 5 - 5s
    {
        if(Screen.width <= 320) //iPhone 5 screen
        {
        return "Your screen size is 320 or lower";
        }else if(Screen.width >= 375){
        return "Your screen size is 375 or higher";
        }else{
        }
    }

    FontLoader
    {
    id: eras;
    source: "https://raw.githubusercontent.com/jmyrland/DriSMo/master/drismo/assets/eras-bold.ttf";
    }

    visible: true
    width: getWidth();
    height: 620
    title: qsTr("Bev Facey App")

    Rectangle
    {
        id: topBlueRectangle;
        x: 0
        y: 0
        width: parent.width;
        height: parent.height / 5
        color: "#004D85";
    }

    Text
    {
        id: mainTitle;
        font.family: eras.name;
        x: 106
        //anchors.centerIn: parent;
        y: 27
        width: 469
        height: 71
        color: "#FFFFFF";
        text: qsTr("Bev Facey\nCommunity High School")
        font.pixelSize: 20
        font.capitalization: Font.MixedCase
        //anchors.verticalCenterOffset: 0
        //anchors.horizontalCenterOffset: 0
        renderType: Text.QtRendering
    }


    Text
    {
        id: testWidth;
        x: 158
        y: 159
        text: getWidth();
        font.pixelSize: 12
    }

    Image
    {
        id: bevFaceyLogo
        x: 0
        y: 12
        width: 100
        height: 100
        source: "qrc:/images/Bev_Facey_Logo.png"
    }

}
