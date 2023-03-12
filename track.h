#ifndef TRACK_H
#define TRACK_H

#include <QString>
#include <QList>

#include "tag.h"

class Track
{
    private:
        QString name;
        QString title;
        QString author;
        QString path;
        QList<Tag> tags;
    public:
        Track(QString,QString,QString,QString,QList<Tag>);
        Track(QString,QString,QString,QString);
        void addNewTag(Tag);
        int getCount();
        QString getName();
        QString getTitle();
        QString getAuthor();
        QString getPath();
        Tag getTagByIndex(int);
        QList<Tag> getTags();
};

#endif // TRACK_H
