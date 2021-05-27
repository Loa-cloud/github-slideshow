import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12



GridLayout {
    id: gl

    width: 750
    height: 750

    columns: 4
    rows: 4

    columnSpacing: 0
    rowSpacing: 0

    signal win()

    function newGame(){

        var newGameConfigs = helper.newGame()
        for (var j = 0; j < newGameConfigs.length; j++)
            cards.itemAt(j).light = 0

        for (var i = 0; i < newGameConfigs.length; i++)
            cards.itemAt(i).config = newGameConfigs[i]

        for (var l = 0; l < 16; l++)
            cards.itemAt(l).closeImage()


    }

    function light(){
        // создание массива зажжености карточек
        var cardsLights = []
        for (var j = 0; j < 16; j++)
            cardsLights[j] = cards.itemAt(j).light

        // проверка массива на открытые карты
        var opencard = 0
        for (var o = 0; o < 16; o++){
            if (cardsLights[o] === 1)
                opencard++
        }
        var card1 = -1
        var card2 = -1
        if(opencard === 2){
            for (var p = 0; p < 16; p++){
                if (cardsLights[p] === 1){
                    card1 = p
                    break
                }
            }
            for (var u =16; u >= 0; u--){
                if (cardsLights[u] === 1){
                    card2 = u
                    break
                }

            }
            if (cards.itemAt(card1).config === cards.itemAt(card2).config){
                cards.itemAt(card1).light = -1
                cards.itemAt(card2).light = -1
                cardsLights[card1] = -1
                cardsLights[card2] = -1
            }
        }
        // закрытие карт
        if (opencard === 3){
            for (var q = 0; q < 16; q++){
                if (cardsLights[q] === 1){
                    cards.itemAt(q).light = 0
                    cards.itemAt(q).closeImage()
                }
            }
        }
        // проверка на победу
        var victory = 0
        for (var v = 0; v < 16; v++){
            if (cardsLights[v] === -1)
                victory++
            if (victory === 16)
                win()
        }
    }



    Repeater{
        id: cards
        model: 16
        Card{
            onRotated: gl.light()
        }
    }

    Component.onCompleted: newGame()

}
