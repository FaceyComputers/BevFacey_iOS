import QtQuick 2.5
import QtWebKit 3.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.0

Item {
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
    WebView {
        id: webView;
        url: "https://faceycomputers.github.io/BevFacey_iOS/Map-Tracker/map.html";
        anchors.fill: parent;

    }
}
