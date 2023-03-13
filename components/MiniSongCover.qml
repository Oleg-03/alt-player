import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconPlayed:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M16 37.85v-28l22 14Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }

    readonly property string iconPaused:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M28.25 38V10H36v28ZM12 38V10h7.75v28Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }



    property int itemSize: 56
    property int radius: 4
    property bool overlay: false
    property alias source: cover.source

    id: root

    height: itemSize
    width: itemSize

    state: "inactive"

    icon.width: itemSize / 1.75
    icon.height: itemSize / 1.75

    background: Item
    {
        SongCover
        {
            id: cover
            itemSize: root.itemSize
            radius: root.radius
        }

        Rectangle
        {
            width: itemSize
            height: itemSize
            color: "#80000000"
            visible: root.overlay
            radius: root.radius
        }
    }


    states:
    [
        State
        {
            name: "inactive"
            PropertyChanges
            {
                target: root
                icon.source: ""
                overlay: false
            }
        },
        State
        {
            name: "played"
            PropertyChanges
            {
                target: root
                icon.source: root.iconPlayed
                overlay: true
            }
        },
        State
        {
            name: "paused"
            PropertyChanges
            {
                target: root
                icon.source: root.iconPaused
                overlay: true
            }
        }
    ]

    onClicked:
    {
        switch (state)
        {
        case "inactive":
            state = "played"
            break

        case "played":
            state = "paused"
            break

        case "paused":
            state = "inactive"
            break
        }
    }
}
