#ifndef LANGUAGE_H
#define LANGUAGE_H

#include "config.h"

class Language : Config
{
public:
    Language(const QString path);

    QString getName();
    QString getCode();
    QVariantMap getComponents();
};

#endif // LANGUAGE_H
