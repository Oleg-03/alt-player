import QtQuick
import QtQuick.Controls

Button
{
    readonly property string iconNext:
    {
        var svg = "data:image/svg+xml;utf8,<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"%1\" height=\"48\" width=\"48\"><path d=\"M34 36V12h3v24Zm-23 0V12l17.3 12Z\"/></svg>"
        return svg.arg(themeColor.secondary_container)
    }

    property int itemSize: 48

    height: itemSize
    width: itemSize

    icon.width: itemSize / 1.75
    icon.height: itemSize / 1.75
    icon.source: iconNext

    background: Rectangle
    {
        color: "transparent"
    }
}
