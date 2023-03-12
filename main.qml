import QtQuick
import QtQuick.Controls

Window
{
    width: 412
    height: 817
    visible: true

    color: themeColor.surface

    PlayPauseButton
    {
        anchors.centerIn: parent

        onClicked:
        {
            console.log(checked)
        }
    }


}
