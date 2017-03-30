#ifndef MAINFUNCTION_H
#define MAINFUNCTION_H

#include <QObject>
#include <QDebug>

class mainfunction : public QObject
{
    Q_OBJECT
public:
    explicit mainfunction(QObject *parent = 0);
    Q_INVOKABLE void setSize(int width, int height);
    Q_INVOKABLE void setWidth(int width);
signals:

public slots:
private:
    int widthSize;
    int heightSize;
};

#endif // MAINFUNCTION_H
