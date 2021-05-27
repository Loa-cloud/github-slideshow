    import QtQuick 2.12
    import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2


Rectangle {
    width: 150
    height: 150
    property int config: 0
    property int light: 0


    Actor{
        id: actor
        visible: true
        width: 150
        height: 150

    }

   signal rotated()

    function rotate(){
        if (light == 0)
            light = 1
         rotated()
    }

    function openImage(){
        // если карта закрыта, то открываем
        if(light === 0){
            if (config === 1)
                actor.jumpTo("image1")
            if (config === 2)
                actor.jumpTo("image2")
            if (config === 3)
                actor.jumpTo("image3")
            if (config === 4)
                actor.jumpTo("image4")
            if (config === 5)
                actor.jumpTo("image5")
            if (config === 6)
                actor.jumpTo("image6")
            if (config === 7)
                actor.jumpTo("image7")
            if (config === 8)
                actor.jumpTo("image8")
        }
    }
    function closeImage(){
        actor.jumpTo("image0")
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            openImage()
            rotate()
        }
    }
    //Component.onCompleted: watImage()


}
