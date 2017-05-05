#include "mainfunction.h"
//#include "curl/curl.h"

using namespace std;

mainfunction::mainfunction(QObject *parent) : QObject(parent)
{

}

void mainfunction::load(QString URL)
{
    isAlreadydone = false;
    if(articleListName.length() > 0)
    {
        while(true)
        {
        if(articleListName.length() == 0)
        {
            break;
        }
        for(int a = 0; a < articleListName.length(); a++)
        {
            articleListName.takeAt(a);
        }
        }
        while(true)
        {
        if(articleListText.length() == 0)
        {
            break;
        }
        for(int a = 0; a < articleListText.length(); a++)
        {
            articleListText.takeAt(a);
        }
        }
        while(true)
        {
        if(Location.length() == 0)
        {
            break;
        }
        for(int a = 0; a < Location.length(); a++)
        {
            Location.takeAt(a);
        }
        }
        while(true)
        {
        if(Location_Article.length() == 0)
        {
            break;
        }
        for(int a = 0; a < Location_Article.length(); a++)
        {
            Location_Article.takeAt(a);
        }
        }
    }
    url = URL;
    access = new QNetworkAccessManager(this);
    connect(access, SIGNAL(finished(QNetworkReply*)), this, SLOT(getData(QNetworkReply*)));
    access->get(QNetworkRequest(QUrl(URL)));
}

int mainfunction::updates()
{
    //qDebug() << articleListName.length();
    return articleListName.length();
}

QString mainfunction::getTitleStringfromList(int value)
{
    return articleListName.at(value);
}

QString mainfunction::getTextStringfromList(int value)
{
    return articleListText.at(value);
}

QString mainfunction::getURLStringfromList(int value)
{
    return articleURL.at(value);
}

void mainfunction::getData(QNetworkReply* reply)
{
    if(isAlreadydone == false)
    {
     updateString = reply->readAll();
     listData();
     isAlreadydone = true;
    }
}

void mainfunction::listData()
{
    unsigned int position = 0;
    unsigned int position_2 = 0;
    bool isTrue = true;

    updateString.replace("\n", "");
    updateString.replace("\t", "");

    if(url == "http://bevfacey.ca/") //Article
    {
    do //Get Position of the article
    {
        position = updateString.indexOf("<h2 class=\"article-title\">", position + 1);
        position_2 = updateString.indexOf("</h2>", position_2 + 1);
        if(position == 4294967295) //(2 ^ 32) - 1
        {
            isTrue = false;
            break;
        }
        Location.append(position);
        Location_Article.append(position_2);
    }while(isTrue == true);

    for(int a = 0; a < Location_Article.length(); a++) //Get Title
    {
        QString newtext = updateString;
        newtext.replace(0, Location.at(a), "");
        int end = newtext.indexOf(">") + 1;
        newtext.replace(0, end, "");
        int end2 = newtext.indexOf("<");
        newtext.replace(end2, newtext.length(), "");
        articleListName.append(newtext);
    }

    int defaulth2 = 5; //Need this to erase </h2>

    for(int a = 0; a < Location_Article.length(); a++) //Get Article
    {
        QString newtext = updateString;
        newtext.replace(0, Location_Article.at(a) + defaulth2, "");
        int end = newtext.indexOf("<div class=\"block_video video-container video_wrapper\">");
        newtext.replace(end, newtext.length(), "");
        int image = newtext.indexOf("src=\"");
        if(image != -1)
        {
            QString urls = newtext;
            urls.replace(0, image + 5, "");
            int end_2 = urls.indexOf("\"");
            urls.replace(end_2, urls.length(), "");
            QString final = urls;
            if(!(urls.contains("http:")))
            {
                final = url + urls;
            }
            articleURL.append(final);

            int end_for_newtext = newtext.indexOf("/>", image);
            newtext.replace(image - 12, end_for_newtext, "");
            newtext.replace("<img alt=\"", "");
        }else{
            articleURL.append("NULL");
        }
        articleListText.append(newtext);
    }
    }

    if(url == "http://bevfacey.ca/about/bell-times") //Bell Times
    {
        updateString.replace("\n", "");
        updateString.replace("<td>", "\n");
        updateString.replace("<tr>", "");
        updateString.replace("</tr>", "");
        updateString.replace("</td>", "");
        updateString.replace("<table style=\"height: 317px;\" width=\"313\">", "");
        updateString.replace("<table style=\"height: 316px;\" width=\"337\">", "");
        updateString.replace("</table>", "");
        updateString.replace("<strong>", "");
        updateString.replace("</strong>", "");
        updateString.replace("<tbody>", "");
        updateString.replace("tbody", "");
        updateString.replace("</>", "");
        updateString.replace("<p>", "");
        updateString.replace("</p>", "");

        do //Get Position of the article
        {
            position = updateString.indexOf("<h2 class=\"article-title\">", position + 1);
            position_2 = updateString.indexOf("</h2>", position_2 + 1);
            if(position == 4294967295) //(2 ^ 32) - 1
            {
                isTrue = false;
                break;
            }
            Location.append(position);
            Location_Article.append(position_2);
        }while(isTrue == true);

        for(int a = 0; a < Location_Article.length(); a++) //Get Title
        {
            QString newtext = updateString;
            newtext.replace(0, Location.at(a), "");
            int end = newtext.indexOf(">") + 1;
            newtext.replace(0, end, "");
            int end2 = newtext.indexOf("<");
            newtext.replace(end2, newtext.length(), "");
            articleListName.append(newtext);
        }

        int defaulth2 = 5; //Need this to erase </h2>

        for(int a = 0; a < Location_Article.length(); a++) //Get Article
        {
            QString newtext = updateString;
            newtext.replace(0, Location_Article.at(a) + defaulth2, "");
            int end = newtext.indexOf("<div class=\"block_video video-container video_wrapper\">");
            newtext.replace(end, newtext.length(), "");
            articleListText.append(newtext);
        } 

    }
}
