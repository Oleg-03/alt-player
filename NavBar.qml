import QtQuick

Rectangle
{
    width: parent.width
    height: 80
    color: themeColor.surface2
    anchors.bottom: parent.bottom

    Row
    {
        anchors.fill: parent
        NavBarButton
        {
            id: player
            buttonType: "player"
            state: "active"

            onClicked:
            {
                player.state = "active"
                playlists.state = "inactive"
                settings.state = "inactive"
            }
        }
        NavBarButton
        {
            id: playlists
            buttonType: "playlists"
            state: "inactive"

            onClicked:
            {
                player.state = "inactive"
                playlists.state = "active"
                settings.state = "inactive"
            }
        }
        NavBarButton
        {
            id: settings
            buttonType: "settings"
            state: "inactive"

            onClicked:
            {
                player.state = "inactive"
                playlists.state = "inactive"
                settings.state = "active"
            }
        }
    }
}
