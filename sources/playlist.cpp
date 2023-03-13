#include "headers/playlist.h"

// ctor for db
Playlist::Playlist(int id, QString picture_path, QString name, QString creation, int count, QList<Playlist> child_playlists, QList<Track> trackes) :
    id(id), picture_path(picture_path), name(name), creation(creation), count(count), child_playlists(child_playlists), trackes(trackes)
{
}
// ctor for back
Playlist::Playlist(QString picture_path, QString name, QString creation) :
    picture_path(picture_path), name(name), creation(creation)
{
}

void Playlist::newPlaylist(Playlist playlist)
{
    this->child_playlists.append(playlist);
}

void Playlist::newTrack(Track track)
{
    this->trackes.append(track);
}

QList<Playlist> Playlist::getChildPlaylists()
{
    return this->child_playlists;
}

QList<Track> Playlist::getChildTrackes()
{
    return this->trackes;
}

int Playlist::getId()
{
    return this->id;
}

QString Playlist::getName()
{
    return this->name;
}

QString Playlist::getPicturePath()
{
    return this->picture_path;
}

QString Playlist::getCreation()
{
    return this->creation;
}

int Playlist::getRecordsCount()
{
    return this->count;
}

void Playlist::setName(QString newName)
{
    this->name = newName;
}




