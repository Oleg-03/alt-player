import QtQuick
import QtQuick.Controls

RoundButton
{
    readonly property string iconPlayed:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M16 37.85v-28l22 14Z\"/></svg>"
        return svg.arg(themeColor.surface)
    }

    readonly property string iconPaused:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M28.25 38V10H36v28ZM12 38V10h7.75v28Z\"/></svg>"
        return svg.arg(themeColor.surface)
    }

    property int itemSize: 60

    id: root

    height: itemSize
    width: itemSize

    radius: 18

    state: "paused"

    icon.width: itemSize / 1.75
    icon.height: itemSize / 1.75

    background: Rectangle
    {
        anchors.fill: parent
        color: themeColor.primary
        radius: parent.radius
    }

    states:
    [
        State
        {
            name: "played"
            PropertyChanges
            {
                target: root
                icon.source: root.iconPlayed
            }
        },
        State
        {
            name: "paused"
            PropertyChanges
            {
                target: root
                icon.source: root.iconPaused
            }
        }
    ]

    onClicked:
    {
        state = (state === "played") ? ("paused") : ("played")
    }
}
