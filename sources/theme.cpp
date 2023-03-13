#include "headers/theme.h"

Theme::Theme(const QString path) : Config(path) {}

QString Theme::getName()
{
    return this->getValue("name").toString();
}

QString Theme::getDescription()
{
    return this->getValue("description").toString();
}

QString Theme::getAuthor()
{
    return this->getValue("author").toString();
}

QVariantMap Theme::getColors()
{
    return this->getArray("colors");
}

