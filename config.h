#ifndef CONFIG_H
#define CONFIG_H

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonValue>
#include <QFile>
#include <QString>
#include <QVariantMap>

#include <stdexcept>

class Config
{
protected:
    QFile file;
    QJsonObject jsonObj;

protected:
    Config(const QString path);
    QVariant getValue(const QString key);
    QVariantMap getArray(const QString key);
};

#endif // CONFIG_H
