#ifndef THEME_H
#define THEME_H

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonValue>
#include <QFile>
#include <QString>
#include <QVariantMap>

#include <stdexcept>

class Theme
{
private:
    QFile file;
    QJsonObject jsonObj;

public:
    Theme(const QString path);

    QString getName();
    QString getDescription();
    QString getAuthor();
    QVariantMap getColors();
};

#endif // THEME_H
