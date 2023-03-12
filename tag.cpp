#include "tag.h"

Tag::Tag(QString tag_name, QString tag_color) : tag_name(tag_name), tag_color(tag_color)
{
}

QString Tag::getName(QString)
{
    return this->tag_name;
}

QString Tag::getColor(QString)
{
    return this->tag_color;
}


