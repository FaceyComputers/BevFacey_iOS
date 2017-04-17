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
            375; //414, 375, 320 Debug
        }
    }
    height: 620 //620
    title: qsTr("Bev Facey App")

    FontLoader {
    id: eras;
    source: "qrc:/font/eras-bold.ttf";
    }

    Item {
        id: busyIndicator;
    BusyIndicator {
        id: loadingBar;
        x: root.width / 2 - 30;
        y: root.height / 2;
        running: image.status = Image.Loading;
    }

    Text {
        id: loadingWarning;
        visible: false;
        x: root.width / 2 - 85;
        y: root.height / 2 + 65;
        text: "Hmm, this is taking a while.";
    }
    }

    Loader {
    id: loader;
    source: "Menu.qml"
    anchors.fill: parent;
    visible: true;
    }

    Loader {
    id: mainLoader;
    source: "Main_Loader.qml"
    anchors.fill: parent;
    visible: true;
    }

    Loader {
         x: 0
         y: 150
         z: -1;
         width: root.width;
         height: root.height;
         id: pageLoader // ID needed for so we can later delete the item
         //source: "Bell_Times.qml"
         //focus: true
         visible: false;
    }
}


