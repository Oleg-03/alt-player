import QtQuick
import QtQuick.Controls

import "./components/"

Window
{
//    maximumHeight: 817
//    maximumWidth: 412

    minimumWidth: 412
    minimumHeight: 817

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

        color: themeColor.surface

        TagBar
        {
            height: 30
            width: songCover.width - 30

            Component.onCompleted:
            {
                items.append({ "itemTitle": "Tag one", "itemColor": "red" })
                items.append({ "itemTitle": "Tag two", "itemColor": "blue" })
                items.append({ "itemTitle": "Tag three", "itemColor": "green" })
                items.append({ "itemTitle": "Tag four", "itemColor": "pink" })
            }

            anchors.bottom: songCover.top
            anchors.bottomMargin: 20

            anchors.left: songCover.left
            anchors.leftMargin: -24
        }

        Rectangle
        {
            width: 30
            height: 30
            color: "transparent"

            border.color: themeColor.outline
            border.width: 1
            radius: 30

            anchors.right: songCover.right

            anchors.bottom: songCover.top
            anchors.bottomMargin: 20
        }

        SongCover
        {
            id: songCover
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -107
        }

        Item
        {
            anchors.left: songCover.left
            anchors.right: songCover.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 282

            PlayPauseButton
            {
                anchors.centerIn: parent
            }

            NextSongButton
            {
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 79
            }

            PrevSongButton
            {
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -79
            }

            ShuffleButton
            {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            RepeatButton
            {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    ScreenPlaylists
    {
        id: screenPlaylists
        visible: false

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: navBar.top

        color: themeColor.surface
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
