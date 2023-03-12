import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconInactive:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"m14 44-8-8 8-8 2.1 2.2-4.3 4.3H35v-8h3v11H11.8l4.3 4.3Zm-4-22.5v-11h26.2l-4.3-4.3L34 4l8 8-8 8-2.1-2.2 4.3-4.3H13v8Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }

    readonly property string iconPlaylist:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M5 46q-1.2 0-2.1-.9Q2 44.2 2 43V5q0-1.2.9-2.1Q3.8 2 5 2h38q1.2 0 2.1.9.9.9.9 2.1v38q0 1.2-.9 2.1-.9.9-2.1.9Zm9-2 2.1-2.2-4.3-4.3H38v-11h-3v8H11.8l4.3-4.3L14 28l-8 8Zm-4-22.5h3v-8h23.2l-4.3 4.3L34 20l8-8-8-8-2.1 2.2 4.3 4.3H10Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }

    readonly property string iconOnce:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M5 46q-1.2 0-2.1-.9Q2 44.2 2 43V5q0-1.2.9-2.1Q3.8 2 5 2h38q1.2 0 2.1.9.9.9.9 2.1v38q0 1.2-.9 2.1-.9.9-2.1.9Zm9-2 2.1-2.2-4.3-4.3H38v-11h-3v8H11.8l4.3-4.3L14 28l-8 8Zm9.3-14.1h2.45V18H20.5v2.45h2.8ZM10 21.5h3v-8h23.2l-4.3 4.3L34 20l8-8-8-8-2.1 2.2 4.3 4.3H10Z\"/></svg>"
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
            name: "inactive"
            PropertyChanges
            {
                target: button
                icon.source: button.iconInactive
            }
        },
        State
        {
            name: "playlist"
            PropertyChanges
            {
                target: button
                icon.source: button.iconPlaylist
            }
        },
        State
        {
            name: "once"
            PropertyChanges
            {
                target: button
                icon.source: button.iconOnce
            }
        }
    ]

    onClicked:
    {
        switch (state)
        {
        case "inactive":
            state = "playlist"
            break

        case "playlist":
            state = "once"
            break

        case "once":
            state = "inactive"
            break
        }
    }
}
