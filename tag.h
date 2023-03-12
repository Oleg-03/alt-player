#ifndef TAG_H
#define TAG_H
#include <QString>

class Tag
{
    private:
        QString tag_name;
        QString tag_color;
    public:
        Tag(QString,QString);
        QString getName(QString);
        QString getColor(QString);
};

#endif // TAG_H
