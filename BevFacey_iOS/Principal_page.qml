import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Javascript.js" as Script

Item {
    id: rootPrincipal;
    width: {
        mainfunction.load("http://bevfacey.ca/about/principals-message");
        if(Screen.width != 1680)
        {
            root.width;
        }
        else{
            375; //414, 375, 320 Debug
        }
    }
    height: 640;
}
