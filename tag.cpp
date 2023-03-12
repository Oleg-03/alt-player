#include "tag.h"

Tag::Tag(QString tag_name, QString tag_color) : tag_name(tag_name), tag_color(tag_color)
{
}

QString Tag::getName()
{
    return this->tag_name;
}

QString Tag::getColor()
{
    return this->tag_color;
}


