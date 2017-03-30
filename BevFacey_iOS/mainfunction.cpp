#include "mainfunction.h"

mainfunction::mainfunction(QObject *parent) : QObject(parent)
{

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
