import QtQuick

Rectangle
{
    property alias tagTitle: tagTitle.text
    property alias tagColor: tagColor.color

    tagTitle: "Tag name"
    tagColor: themeColor.primary


    height: 30
    radius: 30

    width: 5 + tagTitle.width + 6 + tagColor.width + 9

    color: "transparent"

    border.color: themeColor.outline
    border.width: 1

    Rectangle
    {
        id: tagColor

        width: 20
        height: 20
        radius: 20

        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    Text
    {
        id: tagTitle

        anchors.left: tagColor.right
        anchors.leftMargin: 4
        anchors.verticalCenter: parent.verticalCenter

        font.family: "Roboto"
        font.pointSize: 13
        color: themeColor.on_surface_variant
    }
}
