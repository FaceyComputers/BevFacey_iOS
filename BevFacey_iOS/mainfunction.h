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
    Q_INVOKABLE QString updates();

private:
    QString updateString;
    QNetworkAccessManager *access;
    //std::map<QList<QString>, QList<QString>> articleList;
    QList<QString> articleListName;
    QList<QString> articleListText;
    QList<int> Location;
    void listData();
private slots:
    void getData(QNetworkReply *reply);
};

#endif // MAINFUNCTION_H
