import QtQuick 2.0

Item {
    id: mediaPage;
    width: root.width;
    height: root.height;
    y: 10;
    Flickable {
        contentWidth: root.width;
        contentHeight: 1080;
        anchors.fill: parent;

        Item {
            id: youTube;
            Image {
                z: 1;
                source: "qrc:/images/YouTube_Logo.png";
                width: mediaPage.width - 40;
                height: 230;
                y: 10;
                x: 20;
            }
            Rectangle {
                x: 10;
                color: "#004D85";
                width: mediaPage.width - 20;
                height: 250;
            }
        }

        Item {
            id: twitter;
            Image {
                z: 1;
                source: "qrc:/images/Twitter_Logo.png";
                width: mediaPage.width - 40;
                height: 280;
                y: 280;
                x: 20;
            }
            Rectangle {
                x: 10;
                color: "#004D85";
                width: mediaPage.width - 20;
                height: 300;
                y: 270;
            }
        }

        Item {
            id: faceBook;
            Image {
                z: 1;
                source: "qrc:/images/Facebook_Logo.png";
                width: mediaPage.width - 40;
                height: 300;
                y: 600;
                x: 20;
            }
            Rectangle {
                x: 10;
                color: "#004D85";
                width: mediaPage.width - 20;
                height: 320;
                y: 590;
            }
        }
    }
}
