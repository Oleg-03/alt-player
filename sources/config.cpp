#include "config.h"

Config::Config(const QString path)
    : file(path)
{
    if (!this->file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        throw std::runtime_error("Could not open a file with a theme at the path '" + this->file.fileName().toStdString() + "'");
    }

    QJsonParseError jsonError;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(QString(this->file.readAll()).toUtf8(), &jsonError);

    if (jsonError.error != QJsonParseError::NoError)
    {
        throw std::runtime_error("Error parsing JSON document '" + this->file.fileName().toStdString() + "': " + jsonError.errorString().toStdString());
    }

    if (!jsonDoc.isObject())
    {
        throw std::runtime_error("The document '" + this->file.fileName().toStdString() + "' is not JSON");
    }

    this->jsonObj = jsonDoc.object();
}

QVariant Config::getValue(const QString key)
{
    QVariant value = jsonObj.value(key);

    if (value.isNull())
    {
        throw std::runtime_error("Value '" + key.toStdString() + "' not found in file '" + file.fileName().toStdString() + "'");
    }

    return value;
}

QVariantMap Config::getArray(const QString key)
{
    QVariantMap array = jsonObj.toVariantMap();

    if (!array.contains(key) || !array[key].canConvert<QVariantMap>())
    {
        throw std::runtime_error("Problem reading the '" + key.toStdString() + "' associative array in a file '" + file.fileName().toStdString() + "'");
    }

    return array[key].toMap();
}
