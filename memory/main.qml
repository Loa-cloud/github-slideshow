import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2


Window {
    id: w

    minimumWidth: cl.width
    maximumWidth: cl.width
    width: 768

    minimumHeight: cl.height
    maximumHeight: cl.height
    height: 768

    visible: true
    title: qsTr("Memory Cards")

    ColumnLayout {
        id: cl
        anchors.centerIn: w.contentItem
        spacing: 2

        Gameplay{
            id: gameplay
            onWin: {
                wino.change()
            }


        }
        Toolbar{
            id: toolbar

            onNewGame: gameplay.newGame()
            onQuitApp: Qt.quit()
        }

    }

    Dialog{
        id: wino
        visible: false
        onButtonClicked: gameplay.newGame()

        Text {
            id: textwin
            text: ("Вы победили!")
            font.pointSize: 40
        }

        function change(){
            visible = true
        }
    }

}

