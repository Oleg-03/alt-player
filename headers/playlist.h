#ifndef PLAYLIST_H
#define PLAYLIST_H

#include <QString>
#include <QList>

#include "headers/track.h"
#include "headers/database.h"

class Playlist
{
    private:
        int id;
        QString picture_path;
        QString name;
        QString creation;
        int count;
        QList<Playlist> child_playlists;
        QList<Track> trackes;
    public:
        Playlist(int,QString,QString,QString,int,QList<Playlist>,QList<Track>);
        Playlist(QString,QString,QString);
        void newPlaylist(Playlist playlist);
        void newTrack(Track track);
        QList<Playlist> getChildPlaylists();
        QList<Track> getChildTrackes();
        int getId();
        QString getName();
        QString getPicturePath();
        QString getCreation();
        int getRecordsCount();
        void setName(QString newName);
};

#endif // PLAYLIST_H
