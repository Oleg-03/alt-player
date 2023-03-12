#include "theme.h"

Theme::Theme(const QString path)
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

QString Theme::getName()
{
    QString name = jsonObj.value("name").toString();

    if (name.isEmpty())
    {
        throw std::runtime_error("Value 'name' not found in file '" + file.fileName().toStdString() + "'");
    }

    return name;
}

QString Theme::getDescription()
{
    QString description = jsonObj.value("description").toString();

    if (description.isEmpty())
    {
        throw std::runtime_error("Value 'description' not found in file '" + file.fileName().toStdString() + "'");
    }

    return description;
}

QString Theme::getAuthor()
{
    QString author = jsonObj.value("author").toString();

    if (author.isEmpty())
    {
        throw std::runtime_error("Value 'author' not found in file '" + file.fileName().toStdString() + "'");
    }

    return author;
}

QVariantMap Theme::getColors()
{
    QVariantMap colors = jsonObj.toVariantMap();

    if (!colors.contains("colors") || !colors["colors"].canConvert<QVariantMap>())
    {
        throw std::runtime_error("Problem reading the 'colors' associative array in a file '" + file.fileName().toStdString() + "'");
    }

    return colors["colors"].toMap();
}

