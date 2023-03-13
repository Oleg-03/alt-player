import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconPlayer:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M16 37.85v-28l22 14Z\"/></svg>"
        return svg.arg(themeColor.on_surface_variant)
    }

    readonly property string iconPlaylists:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M32 40q-2.45 0-4.2-1.675t-1.75-4.075q0-2.4 1.675-4.075Q29.4 28.5 31.8 28.5q.8 0 1.575.15.775.15 1.525.5V12H44v3.55h-6.1V34.3q0 2.35-1.725 4.025Q34.45 40 32 40ZM6 31.5v-3h15.3v3Zm0-8.25v-3h23.65v3ZM6 15v-3h23.65v3Z\"/></svg>"
        return svg.arg(themeColor.on_surface_variant)
    }

    readonly property string iconSettings:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"m19.4 44-1-6.3q-.95-.35-2-.95t-1.85-1.25l-5.9 2.7L4 30l5.4-3.95q-.1-.45-.125-1.025Q9.25 24.45 9.25 24q0-.45.025-1.025T9.4 21.95L4 18l4.65-8.2 5.9 2.7q.8-.65 1.85-1.25t2-.9l1-6.35h9.2l1 6.3q.95.35 2.025.925Q32.7 11.8 33.45 12.5l5.9-2.7L44 18l-5.4 3.85q.1.5.125 1.075.025.575.025 1.075t-.025 1.05q-.025.55-.125 1.05L44 30l-4.65 8.2-5.9-2.7q-.8.65-1.825 1.275-1.025.625-2.025.925l-1 6.3ZM24 30.5q2.7 0 4.6-1.9 1.9-1.9 1.9-4.6 0-2.7-1.9-4.6-1.9-1.9-4.6-1.9-2.7 0-4.6 1.9-1.9 1.9-1.9 4.6 0 2.7 1.9 4.6 1.9 1.9 4.6 1.9Z\"/></svg>"
        return svg.arg(themeColor.on_surface_variant)
    }

    property string buttonType
    property int itemSize: 24

    id: root
    height: parent.height
    width: parent.width / 3

    background: Rectangle
    {
        color: "transparent"
    }

    Rectangle
    {
        id: iconBackground
        color: themeColor.secondary_container
        width: 64
        height: 32
        radius: 16
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14
    }

    Image
    {
        width: itemSize
        height: itemSize

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -14

        source:
        {
            switch (root.buttonType)
            {
            case "player":    return iconPlayer
            case "playlists": return iconPlaylists
            case "settings":  return iconSettings
            }
        }
    }

    Text
    {
        text:
        {
            switch (root.buttonType)
            {
            case "player":    return language.navbar.playerButton
            case "playlists": return language.navbar.playlistsButton
            case "settings":  return language.navbar.settingsButton
            }
        }

        font.family: "Roboto"
        font.pixelSize: 14
        color: themeColor.on_surface_variant

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 16
    }

    states:
    [
        State
        {
            name: "inactive"
            PropertyChanges
            {
                target: iconBackground
                visible: false
            }
        },
        State
        {
            name: "active"
            PropertyChanges
            {
                target: iconBackground
                visible: true
            }
        }
    ]

}
