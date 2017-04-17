#include "mainfunction.h"
//#include "curl/curl.h"

using namespace std;

mainfunction::mainfunction(QObject *parent) : QObject(parent)
{

}

void mainfunction::load(QString URL)
{
    access = new QNetworkAccessManager(this);
    connect(access, SIGNAL(finished(QNetworkReply*)), this, SLOT(getData(QNetworkReply*)));
    access->get(QNetworkRequest(QUrl(URL)));
}

QString mainfunction::updates()
{
    int position = updateString.indexOf("<div class=\"main-content\">");
    if(position > 0)
    {
        updateString.replace(0, position, "");
        int position_2 = updateString.indexOf("<h2 class=\"article-title\">Follow us:</h2>");
        updateString.replace(position_2, updateString.length(), "");

        QString name = QCoreApplication::applicationDirPath();
                int positions = name.indexOf("BevFacey_iOS.app");
                name.replace(positions, name.length(), "");
                name.append("Bevfacey.txt");
                ofstream stream;
                stream.open(name.toStdString().c_str());
                stream << updateString.toStdString();
                stream.close();

        return updateString;
    }else{
        return "";
    }
}

void mainfunction::getData(QNetworkReply* reply)
{
     updateString = reply->readAll();
     listData();
}

void mainfunction::listData()
{
    unsigned int position = 0;
    while(true)
    {
        position = updateString.indexOf("<h2 class=\"article-title\">", position + 1);
        if(position == 4294967295)
        {
            break;
        }
        Location.append(position);
        qDebug() << position;
    }
}
