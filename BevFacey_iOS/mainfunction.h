#ifndef MAINFUNCTION_H
#define MAINFUNCTION_H

#include <QObject>

class mainfunction : public QObject
{
    Q_OBJECT
public:
    explicit mainfunction(QObject *parent = 0);

signals:

public slots:
};

#endif // MAINFUNCTION_H