import QtQuick 2.7
import QtQuick.Controls 2.0

Item {
    function setArticleTitle(value)
    {
        articleTitletext.text = value;
    }
    function setText(value)
    {
        articleText.text = value;
    }
    id: test;
    Rectangle{
        id: backgroundFill;
    color: "#004D85";
    x: 10;
    width: 355;
    height: 70;
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
