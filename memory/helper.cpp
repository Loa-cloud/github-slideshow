#include "helper.h"
#include <QDebug>
#include <QVector>

Helper::Helper(QObject *parent) : QObject(parent)
{

}



QVector<int> Helper::newGame()
{
    qDebug() << "NEW GAME";

    QVector<int> cards = {
        0, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 0,
    };

    // генератор поля
    int del = rand()%(17);
    for (int j = 0; j <=1; j++){
        for (int i = 1; i<=8; i++){
            if (cards[del] == 0){
                cards[del] = i;
                del = rand()%(16);
            }else{
                if (del == 15)
                    del = 0;
                else
                    del +=1;
                i -=1;
            }
        }
    }
    return cards;
}



