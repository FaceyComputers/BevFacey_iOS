#include "mainfunction.h"
#include <QMessageBox>
mainfunction::mainfunction(QObject *parent) : QObject(parent)
{
    updateString = "NULL";
}

void mainfunction::load()
{
    updateString = "NULL Update. Please check your internet connection. If you think this is a bug, please contact the developer.";
}

QString mainfunction::updates()
{
    updateString = "NULL Update. Please check your internet connection. If you think this is a bug, please contact the developer.";
    return "NULL Update. Please check your internet connection. If you think this is a bug, please contact the developer.";
}

void mainfunction::setSize(int width, int height)
{
    this->widthSize = width;
    this->heightSize = height;
    qDebug() << "Set size called";
}

void mainfunction::setWidth(int width)
{
    this->widthSize = width;
    qDebug() << "Set size called";
}

int mainfunction::getWidth()
{
    return this->widthSize;
}
