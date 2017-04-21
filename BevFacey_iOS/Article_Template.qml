import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

Item {

        id: articleItem;

        width:{
        if(Screen.width != 1680)
        {
            Screen.width;
        }
        else{
            375; //414, 375, 320 Debug
        }
        }

    function setArticleTitle(value)
    {
        articleTitletext.text = value;
    }
    function setText(value)
    {
        articleText.text = value;
    }
    function setHeight(value)
    {
        backgroundFill.height = value;
    }
    function setImageURL(value)
    {
        image.source = value;
    }

    Rectangle{
        id: backgroundFill;
    color: "#004D85";
    x: 10;
    width: parent.width - 20;
    height: 400;
    }

    Image {
        id: image;
        x: backgroundFill.x + 10;
        y: backgroundFill.y + 10;
        width: backgroundFill.width - 20;
        height: backgroundFill.height - 20;
    }

    Label{
    id: articleTitletext;
    text: "NULL";
    color: "white";
    font.pointSize: 15;
    y: 5;
    x: 15;
    //x: backgroundFill.width / 2 - 100;
    }

    Label{
    id: articleText;
    text: "NULL";
    color: "white";
    font.pointSize: 15;
    y: 15;
    x: 15;
    //x: backgroundFill.width / 2 - 100;
    }
}
