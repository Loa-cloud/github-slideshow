#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include <QVector>


class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = nullptr);

signals:

public slots:
    QVector<int> newGame();
};

#endif // HELPER_H
