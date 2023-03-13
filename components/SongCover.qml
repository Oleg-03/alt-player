import QtQuick
import Qt5Compat.GraphicalEffects

Image
{
    property int itemSize: 360
    property int radius: 14

    source:
    {
        var svg = "data:image/svg+xml;utf8,<svg width=\"%3\" height=\"%3\" viewBox=\"0 0 56 56\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0 0H56V56H0V0Z\" fill=\"%1\"/><path d=\"M26.5278 9.48888C26.7673 9.07407 27.366 9.07407 27.6055 9.48888L36.2273 24.4222C36.4668 24.837 36.1674 25.3555 35.6884 25.3555H18.4449C17.9659 25.3555 17.6665 24.837 17.906 24.4222L26.5278 9.48888Z\" fill=\"%2\"/><path d=\"M8.55556 32.8222C8.55556 32.3067 8.97343 31.8889 9.48889 31.8889H22.2444C22.7599 31.8889 23.1778 32.3067 23.1778 32.8222V45.5778C23.1778 46.0932 22.7599 46.5111 22.2444 46.5111H9.48889C8.97343 46.5111 8.55556 46.0932 8.55556 45.5778V32.8222Z\" fill=\"%2\"/><path d=\"M47.4445 38.8889C47.4445 43.5281 43.6836 47.2889 39.0445 47.2889C34.4053 47.2889 30.6445 43.5281 30.6445 38.8889C30.6445 34.2497 34.4053 30.4889 39.0445 30.4889C43.6836 30.4889 47.4445 34.2497 47.4445 38.8889Z\" fill=\"%2\"/></svg>"
        svg = svg.arg(themeColor.on_surface)
        svg = svg.arg(themeColor.outline)
        return svg.arg(itemSize)
    }

    id: root
    width: itemSize
    height: itemSize

    fillMode: Image.PreserveAspectCrop

    layer.enabled: true
    layer.effect: OpacityMask
    {
        maskSource: Item
        {
            width: root.width
            height: root.height

            Rectangle
            {
                anchors.fill: parent
                radius: root.radius
            }
        }
    }
}
