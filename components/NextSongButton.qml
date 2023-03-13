import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconNext:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"%2\" width=\"%2\"><path d=\"M34 36V12h3v24Zm-23 0V12l17.3 12Z\"/></svg>"
        svg = svg.arg(themeColor.primary)
        return svg.arg(itemSize)
    }

    property int itemSize: 48

    height: itemSize
    width: itemSize

    icon.width: itemSize
    icon.height: itemSize
    icon.source: iconNext

    background: Rectangle
    {
        color: "transparent"
    }
}
