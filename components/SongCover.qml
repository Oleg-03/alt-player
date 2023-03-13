import QtQuick
import Qt5Compat.GraphicalEffects

Image
{
    property int itemSize: 360
    property int radius: 14

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
