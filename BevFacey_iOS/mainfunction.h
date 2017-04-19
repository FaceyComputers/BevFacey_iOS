#ifndef MAINFUNCTION_H
#define MAINFUNCTION_H

#include <QObject>
#include <QDebug>
#include <QString>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QList>
#include <map>
#include <QCoreApplication>
#include <fstream>

class mainfunction : public QObject
{
    Q_OBJECT
public:
    explicit mainfunction(QObject *parent = 0);
    Q_INVOKABLE void load(QString URL);
    Q_INVOKABLE int updates();

    Q_INVOKABLE QString getTitleStringfromList(int value);
    Q_INVOKABLE QString getTextStringfromList(int value);
private:
    QString updateString;
    QNetworkAccessManager *access;
    //std::map<QList<QString>, QList<QString>> articleList;
    QList<QString> articleListName;
    QList<QString> articleListText;
    QList<int> Location_Article;
    QList<int> Location;
    bool isAlreadydone = false;
    void listData();
private slots:
    void getData(QNetworkReply *reply);
};

#endif // MAINFUNCTION_H
