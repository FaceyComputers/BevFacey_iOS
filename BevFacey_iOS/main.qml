import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Javascript.js" as Script

ApplicationWindow { //RAM Average 12.6MB

    id: root;
    visible: true

    width: {
        if(Screen.width != 1680)
        {
            Screen.width;
        }
        else{
            414; //414, 375, 320 Debug
        }
    }
    height: 620 //620
    title: qsTr("Bev Facey App")

    FontLoader {
    id: eras;
    source: "qrc:/font/eras-bold.ttf";
    }


    Rectangle {
        id: topBlueRectangle;
        z: 1;
        x: 0
        y: 0
        width: parent.width;
        height: 100;
        color: "#004D85";
    }

    Text {
        id: mainTitle;
        z: 1;
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
        z: 1;
        x: Script.getPosition(parent.width, "Logo", "X");
        y: Script.getPosition(parent.width, "Logo", "Y");
        width: Script.getPosition(parent.width, "Logo", "Width");
        height: Script.getPosition(parent.width, "Logo", "Height");
        source: "qrc:/images/Bev_Facey_Logo.png"
    }

    property bool isMenuDown: false;

    function dropdown()
    {
        dropinDropMenu.start();
        fadeinDropMenu.start();
        dropDownMenu.visible = true;
        middleBlueMenu.text = "Navigation X";
        isMenuDown = true;
    }

    function backin()
    {
        fadeoutDropMenu.start();
        dropoutDropMenu.start();
        isMenuDown = false;
        original = 0;
        dropDownMenu.height = 550;
        aboutButton.text = "About \u25BC"
        aboutExtended.visible = false;
        middleBlueMenu.text = "Navigation \u2630";
    }

    /*Rectangle {
    id: buttoncolor;
    color: "#003860"
    border.color: "#002947";
    border.width: 2;
    }*/

    Button {
        id: middleBlueMenu;
        x: 0;
        y: 100;
        z: 1;
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
                if(isMenuDown == false)
                {
                dropdown();
                }else{
                backin();
                }
            }
        }

        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
    }

    property int original: 0;

    property int original_2: 0;

    property int original_3: 0;

    property int original_4: 0;

    property int original_5: 0;

    property int original_6: 0;

    Flickable{
        contentWidth: dropDownMenu.width; contentHeight: dropDownMenu.height

        anchors.fill: parent
    Item {
        visible: false;
        id: dropDownMenu;
        y: 1;
        width: root.width; height: 550

        NumberAnimation on y{
                id: dropinDropMenu;
                from: -100;
                to: 150;
                duration: 200
                running: true
            }

        NumberAnimation on y{
                id: dropoutDropMenu;
                from: 150;
                to: -100;
                duration: 200
                running: true
                onRunningChanged: if(fadeoutDropMenu.running == false)
                                  {
                                  dropDownMenu.visible = false;
                                  }
        }

        NumberAnimation on opacity{
                id: fadeinDropMenu;
                from: 0;
                to: 1;
                duration: 200
                running: true
        }

        NumberAnimation on opacity{
                id: fadeoutDropMenu;
                from: 1;
                to: 0;
                duration: 200
                running: true
        }

        Button {
        x: 0;
        y: 0;
        id: aboutButton
        text: "About \u25BC";
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: aboutButton.text;
            opacity: 1.0
            font.pointSize: 20;
            color: aboutButton.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        //backin();
            if(original == 0)
            {
            original = 350;
            dropDownMenu.height = 1000;
            aboutButton.text = "About \u25B2"
            aboutExtended.visible = true;
            }else{
            original = 0;
            dropDownMenu.height = 550;
            aboutButton.text = "About \u25BC"
            aboutExtended.visible = false;
            }
        }
        }
        }

        Item {
            id: aboutExtended;
            visible: false;
        Button {
        x: 0;
        y: 50;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "Bell Times";
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }

        Button {
        x: 0;
        y: 100;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "Calandar"
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }

        Button {
        x: 0;
        y: 150;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "Contact"
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }

        Button {
        x: 0;
        y: 200;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "Documents"
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }

        Button {
        x: 0;
        y: 250;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "Our Schools"
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }

        Button {
        x: 0;
        y: 300;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "Principal's Message"
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }

        Button {
        x: 0;
        y: 350;
        height: 50;
        width: root.width;
        background: Rectangle {
            color: "#003860"
        }
        contentItem: Text{
            text: "School News"
            opacity: 1.0
            font.pointSize: 15;
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
     }
  }

        Button {
        x: 0;
        y: original + 50;
        id: eTeachers
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "eTeachers";
            opacity: 1.0
            font.pointSize: 20;
            color: eTeachers.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        backin();
        }
        }
        }

        Button {
        x: 0;
        y: original + 100;
        id: programs
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Programs \u25BC";
            opacity: 1.0
            font.pointSize: 20;
            color: programs.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        //backin();
        }
        }
        }

        Button {
        x: 0;
        y: original + original_2 + 150;
        id: parents
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Parents \u25BC";
            opacity: 1.0
            font.pointSize: 20;
            color: parents.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        backin();
        }
        }
        }

        Button {
        x: 0;
        y: original + original_2 + original_3 + 200;
        id: students
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Students \u25BC";
            opacity: 1.0
            font.pointSize: 20;
            color: students.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        backin();
        }
        }
        }

        Button {
        x: 0;
        y: original + original_2 + original_3 + original_4 + 250;
        id: athletics;
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
        text: "Athletics \u25BC";
            opacity: 1.0
            font.pointSize: 20;
            color: athletics.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        backin();
        }
        }
        }

        Button {
        x: 0;
        y: original + original_2 + original_3 + original_4 + original_5 + 300;
        id: guidance;
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Guidance \u25BC";
            opacity: 1.0
            font.pointSize: 20;
            color: guidance.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        backin();
        }
        }
        }

        Button {
        x: 0;
        y: original + original_2 + original_3 + original_4 + original_5 + original_6 + 350;
        id: sustainability;
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Sustainability";
            opacity: 1.0
            font.pointSize: 20;
            color: sustainability.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
        backin();
        }
        }
        }

    }
}
}

