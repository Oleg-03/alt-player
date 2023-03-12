import QtQuick
import QtQuick.Controls

RoundButton
{
    readonly property var icon_played:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M16 37.85v-28l22 14Z\"/></svg>"
        return svg.arg(themeColor.surface)
    }

    readonly property url icon_paused:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M28.25 38V10H36v28ZM12 38V10h7.75v28Z\"/></svg>"
        return svg.arg(themeColor.surface)
    }

    property int round: 18
    property int buttonSize: 60


    id: roundButton

    height: buttonSize
    width: buttonSize

    radius: round

    state: "paused"

    checkable: true
    checked: false

    icon.width: buttonSize / 1.75
    icon.height: buttonSize / 1.75

    background: Rectangle
    {
        anchors.fill: parent
        color: themeColor.primary
        radius: parent.round
    }

    states:
    [
        State
        {
            name: "played"
            PropertyChanges {
                target: roundButton
                icon.source: roundButton.icon_played
            }
        },

        State
        {
            name: "paused"
            PropertyChanges {
                target: roundButton
                icon.source: roundButton.icon_paused
            }
        }
    ]

    onCheckedChanged:
    {
        state = state === "played" ? "paused" : "played"
    }
}
