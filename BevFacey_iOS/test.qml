import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2

Rectangle {
    id: myItem

    width: 100; height: 100

    MouseArea {
        anchors.fill: parent
        onClicked: myItem.message("clicked!")
   }

    Text {
        id: text1
        x: 32
        y: 37
        text: qsTr("Text")
        font.pixelSize: 12
    }
}
