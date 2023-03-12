import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconActive:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M5 46q-1.2 0-2.1-.9Q2 44.2 2 43V4.95q0-1.15.9-2.075.9-.925 2.1-.925h38.05q1.15 0 2.075.925.925.925.925 2.075V43q0 1.2-.925 2.1-.925.9-2.075.9Zm24.1-5.5h11.45V29.05h-3v6.35l-9.3-9.2-2.1 2.15 9.2 9.15H29.1Zm-19.45 0 27.9-27.9v6.3h3V7.45H29.1v3h6.35l-27.9 27.9ZM19.8 21.8l2.15-2.15L9.7 7.45 7.55 9.6Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }

    readonly property string iconInactive:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M29.05 40.5v-3h6.25l-9.2-9.15 2.1-2.15 9.3 9.2v-6.35h3V40.5Zm-19.45 0-2.1-2.15 27.9-27.9h-6.35v-3H40.5V18.9h-3v-6.3Zm10.15-18.7L7.5 9.6l2.15-2.15 12.25 12.2Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }

    property int itemSize: 36

    id: button

    height: itemSize
    width: itemSize

    state: "inactive"

    icon.width: itemSize / 1.75
    icon.height: itemSize / 1.75

    background: Rectangle
    {
        color: "transparent"
    }

    states:
    [
        State
        {
            name: "active"
            PropertyChanges
            {
                target: button
                icon.source: button.iconActive
            }
        },
        State
        {
            name: "inactive"
            PropertyChanges
            {
                target: button
                icon.source: button.iconInactive
            }
        }
    ]

    onClicked:
    {
        state = (state === "active") ? ("inactive") : ("active")
    }
}
