import QtQuick

Rectangle
{
    id: root

    width: parent.width
    height: 80
    color: themeColor.surface2
    anchors.bottom: parent.bottom

    property string activeButton: player.buttonType

    signal clicked()

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

                root.activeButton = buttonType
                root.clicked()
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

                root.activeButton = buttonType
                root.clicked()
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

                root.activeButton = buttonType
                root.clicked()
            }
        }
    }
}
