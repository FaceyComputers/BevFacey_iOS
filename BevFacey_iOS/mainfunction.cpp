#include "mainfunction.h"
#include <QMessageBox>
#include <QCoreApplication>
#include <fstream>
//#include "curl/curl.h"

using namespace std;

mainfunction::mainfunction(QObject *parent) : QObject(parent)
{

}

void mainfunction::load()
{
    access = new QNetworkAccessManager(this);
    connect(access, SIGNAL(finished(QNetworkReply*)), this, SLOT(getData(QNetworkReply*)));
    access->get(QNetworkRequest(QUrl("http://bevfacey.ca/")));
}

QString mainfunction::updates()
{
    /*CURL *curl = curl_easy_init();
    CURLcode code;
    curl_easy_setopt(curl, CURLOPT_URL, "https://www.bevfacey.ca");
    //curl_easy_setopt(curl, CURLOPT_WRITEDATA,)
    code = curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    return QString::number(code);*/
    int position = updateString.indexOf("<div class=\"main-content\">");
    //updateString.replace(0, position, "");
    if(position > 0)
    {
        updateString.replace(0, position, "");
        int position_2 = updateString.indexOf("<h2 class=\"article-title\">Follow us:</h2>");
        updateString.replace(position_2, updateString.length(), "");

        /*QString name = QCoreApplication::applicationDirPath();
        int positions = name.indexOf("BevFacey_iOS.app");
        name.replace(positions, name.length(), "");
        name.append("Bevfacey.txt");
        ofstream stream;
        stream.open(name.toStdString().c_str());
        stream << updateString.toStdString();
        stream.close();*/
        //qDebug() << updateString;
        return updateString;
    }else{
        return "";
    }
}

void mainfunction::getData(QNetworkReply* reply)
{
        QString name = QCoreApplication::applicationDirPath();
        int position = name.indexOf("BevFacey_iOS.app");
        name.replace(position, name.length(), "");
        name.append("Bevfacey.txt");
        updateString = reply->readAll();
        //qDebug() << updateString;
        /*ofstream stream;
        if(!(reply->error()))
        {
        stream.open(name.toStdString().c_str());
        stream << reply->readAll().toStdString();
        stream.close();
        }

        ifstream streams;
        streams.open(name.toStdString().c_str());
        string get;
        if(streams.is_open())
        {
            string getdata;
            while(getline(streams, getdata))
            {
                get = getdata;
            }
        }
        updateString = QString::fromStdString(get);
        qDebug() << QString::fromStdString(get);
        streams.close();*/
}

void mainfunction::setSize(int width, int height)
{
    this->widthSize = width;
    this->heightSize = height;
}

void mainfunction::setWidth(int width)
{
    this->widthSize = width;
}

int mainfunction::getWidth()
{
    return this->widthSize;
}
