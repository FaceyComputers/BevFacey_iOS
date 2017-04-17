import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Javascript.js" as Script

Item {
    id: myItem

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

    MouseArea {
        anchors.fill: parent
        onClicked: myItem.message("clicked!")

       Text {
           id: text1
           anchors.centerIn: parent;
           text: "Bell Times"
           font.pixelSize: 25;
       }
   }
}
