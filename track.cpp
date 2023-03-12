#include "track.h"

Track::Track(QString name, QString title, QString author, QString path,QList<Tag> tags) :
    name(name), title(title), author(author), path(path), tags(tags)
{  }

Track::Track(QString name, QString title, QString author, QString path) :
    name(name), title(title), author(author), path(path)
{

}

void Track::addNewTag(Tag tag)
{
    this->tags.push_back(tag);
}

int Track::getCount()
{
    return this->tags.size();
}

QString Track::getName()
{
    return this->name;
}

QString Track::getTitle()
{
    return this->title;
}

QString Track::getAuthor()
{
    return this->author;
}

QString Track::getPath()
{
    return this->path;
}

Tag Track::getTagByIndex(int index)
{
    return this->tags.at(index);
}

QList<Tag> Track::getTags()
{
    return this->tags;
}
