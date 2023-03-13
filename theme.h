#ifndef THEME_H
#define THEME_H

#include "config.h"

class Theme : Config
{
public:
    Theme(const QString path);

    QString getName();
    QString getDescription();
    QString getAuthor();
    QVariantMap getColors();
};

#endif // THEME_H
