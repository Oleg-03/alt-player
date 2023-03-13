import QtQuick
import QtQuick.Controls

import "./components/"

Window
{
    width: 412
    height: 817
    visible: true

    color: themeColor.surface

    ScreenPlayer
    {
        id: screenPlayer
        visible: true

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: navBar.top

        color: "red"
    }

    ScreenPlaylists
    {
        id: screenPlaylists
        visible: false

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: navBar.top

        color: "blue"
    }

    ScreenSettings
    {
        id: screenSettings
        visible: false

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: navBar.top

        color: "green"
    }

    NavBar
    {
        id: navBar

        onClicked:
        {
            switch (activeButton)
            {
            case "player":
                screenPlayer.visible = true
                screenPlaylists.visible = false
                screenSettings.visible = false
                break

            case "playlists":
                screenPlayer.visible = false
                screenPlaylists.visible = true
                screenSettings.visible = false
                break

            case "settings":
                screenPlayer.visible = false
                screenPlaylists.visible = false
                screenSettings.visible = true
                break
            }
        }
    }
}
