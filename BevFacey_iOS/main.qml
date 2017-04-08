import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Javascript.js" as Script

ApplicationWindow {

    id: root;
    visible: true
    width: {
        if(Screen.width != 1680)
        {
            Screen.width;
        }
        else{
            320; //414, 375, 320 Debug
        }
    }
    height: 620
    title: qsTr("Bev Facey App")

    FontLoader {
    id: eras;
    source: "https://raw.githubusercontent.com/jmyrland/DriSMo/master/drismo/assets/eras-bold.ttf";
    }


    Rectangle {
        id: topBlueRectangle;
        x: 0
        y: 0
        width: parent.width;
        height: 100;
        color: "#004D85";
    }

    Text {
        id: mainTitle;
        font.family: eras.name;
        x: Script.getPosition(parent.width, "Title", "X");
        //anchors.centerIn: parent;
        y: Script.getPosition(parent.width, "Title", "Y");
        width: Script.getPosition(parent.width, "Title", "Width");
        height: Script.getPosition(parent.width, "Title", "Height");
        color: "#FFFFFF";
        text: qsTr("Bev Facey\nCommunity High School")
        font.pixelSize: Script.getPosition(parent.width, "Title", "FontSize");
        font.capitalization: Font.MixedCase
        renderType: Text.QtRendering;
    }


    Image {
        id: bevFaceyLogo
        x: Script.getPosition(parent.width, "Logo", "X");
        y: Script.getPosition(parent.width, "Logo", "Y");
        width: Script.getPosition(parent.width, "Logo", "Width");
        height: Script.getPosition(parent.width, "Logo", "Height");
        source: "qrc:/images/Bev_Facey_Logo.png"
    }

    /*MessageDialog {
    id: newarticle;
    function getUpdate()
    {
    return mainfunction.updates();
    }
    title: getUpdate();
    text: getUpdate();
    detailedText: getUpdate();
    Component.onCompleted: {open();}
    }*/

    Button {
        id: middleBlueMenu;
        x: 0;
        y: 100;
        width: parent.width;
        height: 50;
        text: "Navigation \u2630";
        contentItem: Text{
            text: middleBlueMenu.text
            opacity: 1.0
            font.pointSize: 20;
            color: middleBlueMenu.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        MouseArea {
            id: clickArea;
            anchors.fill: parent;
            onClicked: {
                dropDownMenu.visible = true;
            }
        }

        background: Rectangle {color: "#003860"}
    }

    Item {
        visible: false;
        id: dropDownMenu;
        Button {
        x: 0;
        y: 150;
        id: aboutButton
        text: "About";
        width: root.width;
        height: 50;
        background: Rectangle {color: "#003860"}
        contentItem: Text{
            text: aboutButton.text
            opacity: 1.0
            font.pointSize: 20;
            color: aboutButton.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        Button {
        x: 0;
        y: 50;
        id: eTeachers
        text: "eTeachers";
        width: root.width;
        height: 50;
        background: Rectangle {color: "#003860"}
        contentItem: Text{
            text: eTeachers.text
            opacity: 1.0
            font.pointSize: 20;
            color: eTeachers.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        }
    }
}

}
