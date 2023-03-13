import QtQuick

Item
{
    property color color: themeColor.surface
    property int smoothSize: 24
    property alias items: items

    id: root

    Flickable
    {
        width: parent.width
        height: parent.height

        ListView
        {
            width: parent.width
            height: parent.height

            spacing: 8

            model: ListModel
            {
                id: items
            }

            delegate: Tag
            {
                tagTitle: itemTitle
                tagColor: itemColor
            }

            clip: true

            orientation: Qt.Horizontal

            snapMode: ListView.SnapOneItem

            header: Rectangle
            {
                width: smoothSize
                height: parent.height

                color: "transparent"
            }

            footer: Rectangle
            {
                width: smoothSize
                height: parent.height

                color: "transparent"
            }
        }
    }

    Rectangle
    {
        width: root.smoothSize
        anchors.left: parent.left
        height: parent.height

        gradient: Gradient
        {
            GradientStop { position: 0.0; color: root.color }
            GradientStop { position: 1.0; color: "transparent" }
            orientation: Qt.Horizontal
        }
    }

    Rectangle
    {
        width: root.smoothSize
        anchors.right: parent.right
        height: parent.height

        gradient: Gradient
        {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 1.0; color: root.color }
            orientation: Qt.Horizontal
        }
    }
}
