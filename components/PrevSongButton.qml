import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconPrev:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"%2\" width=\"%2\"><path d=\"M11 36V12h3v24Zm26 0L19.7 24 37 12Z\"/></svg>"
        svg = svg.arg(themeColor.primary)
        return svg.arg(itemSize)
    }

    property int itemSize: 48

    height: itemSize
    width: itemSize

    icon.width: itemSize
    icon.height: itemSize
    icon.source: iconPrev

    background: Rectangle
    {
        color: "transparent"
    }
}
