#include "headers/language.h"

Language::Language(const QString path) : Config(path) {}

QString Language::getName()
{
    return this->getValue("name").toString();
}

QString Language::getCode()
{
    return this->getValue("code").toString();
}

QVariantMap Language::getComponents()
{
    return this->getArray("components");
}
