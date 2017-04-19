import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Javascript.js" as Script

Item {
    Rectangle {
        id: topBlueRectangle;
        z: 1;
        x: 0
        y: 0
        width: parent.width;
        height: 100;
        color: "#004D85";
    }

    Flickable {
        contentWidth: testingText.width; contentHeight: 1000

        anchors.fill: parent
    Text {
        z: 1;
        function getData()
        {
        mainfunction.load("http://bevfacey.ca/");
        return "NULL";
        }
        id: testingText
        x: 2
        y: 155
        width: 200;
        height: 100;
        text: qsTr(getData());
        font.pixelSize: 16
        renderType: Text.QtRendering;
    }
    }

    property int counter: 0;

    Timer {
        interval: 20; running: true; repeat: true;
        id: getUpdate;
        onTriggered: {
        var integer = mainfunction.updates();
        if(integer != 0)
        {
            for(var a = 0; a < integer; a++)
            {
            testingText.text = mainfunction.getTextStringfromList(a);
            }
            loadingBar.running = false;
            getUpdate.running = false;
        }
        if(counter > 600)
        {
            loadingWarning.visible = true;
        }
        counter = counter + 1;
        }
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
        dropDownMenuScroll.visible = true;
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
        dropDownMenuScroll.visible = false;
    }

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

    Flickable{
        contentWidth: dropDownMenu.width; contentHeight: dropDownMenu.height
        visible: false;
        id: dropDownMenuScroll;
        anchors.fill: parent

    Item {
        visible: false;
        id: dropDownMenu;
        y: 1;
        width: root.width; height: 300

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
            original = 250;
            dropDownMenu.height = 700;
            aboutButton.text = "About \u25B2"
            aboutExtended.visible = true;
            }else{
            original = 0;
            dropDownMenu.height = 300;
            aboutButton.text = "About \u25BC"
            aboutExtended.visible = false;
            }
        }
        }
        }

        Item {
            id: aboutExtended;
            visible: false;
            y: 0;
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

        MouseArea {
        anchors.fill: parent;
        onClicked: {
            //loader.source = "test.qml";
            //loader.active = true;
            pageLoader.source = "Bell_Times.qml";
            pageLoader.visible = true;
            backin();
        }
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
            text: "Calendar"
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
        y: 200;
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
        y: 250;
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
        id: programButton
        width: root.width;
        height: 50;
        text: "Programs \u25BC";
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: parent.text;
            opacity: 1.0
            font.pointSize: 20;
            color: programButton.down ? "#999999" : "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        MouseArea {
        anchors.fill: parent;
        onClicked: {
            if(original_2 == 0)
            {
            original_2 = 250;
            dropDownMenu.height = 1000;
            programButton.text = "Programs \u25B2"
            programExtended.visible = true;
            }else{
            original_2 = 0;
            dropDownMenu.height = 550;
            programButton.text = "Programs \u25BC"
            programExtended.visible = false;
            }
        }
        }
        }

        Button {
        x: 0;
        y: original + 100;
        id: powerSchool
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "PowerSchool";
            opacity: 1.0
            font.pointSize: 20;
            color: powerSchool.down ? "#999999" : "#ffffff";
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
        y: original + 150;
        id: media
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Media";
            opacity: 1.0
            font.pointSize: 20;
            color: media.down ? "#999999" : "#ffffff";
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
        y: original + 200;
        id: liveMap
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
            text: "Live Map";
            opacity: 1.0
            font.pointSize: 20;
            color: liveMap.down ? "#999999" : "#ffffff";
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
        y: original + 250;
        id: contactUs;
        width: root.width;
        height: 50;
        background: Rectangle {
            color: "#003860"
            border.color: "#002947";
            border.width: 2;
        }
        contentItem: Text{
        text: "Contact Us";
            opacity: 1.0
            font.pointSize: 20;
            color: contactUs.down ? "#999999" : "#ffffff";
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
