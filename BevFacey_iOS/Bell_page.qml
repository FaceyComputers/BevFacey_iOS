import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Javascript.js" as Script

Item {
    id: myItem

    width: {
        mainfunction.load("http://bevfacey.ca/about/bell-times");
        if(Screen.width != 1680)
        {
            Screen.width;
        }
        else{
            414; //414, 375, 320 Debug
        }
    }
    height: 620 //620

    property int counter: 0;
    property int integer: 0;
    property int ys: 0;

    Flickable{
        id: flickable
        anchors.fill: parent
        contentWidth: parent.width;
        contentHeight: 0;

        Item {
            id: articleItems;
            function createArticles()
            {
                for(var a = 0; a < integer; a++)
                {
                //testingText.text = mainfunction.getTextStringfromList(a);
                var comp = Qt.createComponent("Article_Template.qml");
                var object = comp.createObject(articleItems);
                object.y = ys;
                object.setArticleTitle(mainfunction.getTitleStringfromList(a));
                object.setText(mainfunction.getTextStringfromList(a));
                object.setHeight(450);
                ys = ys + 460;
                }
            }

    Timer {
        interval: 20; running: true; repeat: true;
        id: getUpdate;
        onTriggered: {
        integer = mainfunction.updates();
        ys = 10;
        if(integer != 0)
        {
            parent.createArticles();

            flickable.contentHeight = ys + 150; //Add 150 due to menu bar's height is 150
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
        }
            }
}
