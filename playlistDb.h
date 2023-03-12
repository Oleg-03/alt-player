#ifndef PLAYLISTDB_H
#define PLAYLISTDB_H

#include <QSqlQuery>
#include <QList>
#include <QString>

#include "playlist.h"

class PlaylistDb
{
    private:
        QList<Playlist> playlists;
        QSqlQuery *query;
//        bool loadPlaylists();
//        bool loadTrackes();
//        bool loadTags();
//        bool loadPlaylistsInPlaylists();
//        bool loadTrackesInPlaylists();
        QSqlDatabase open();
        void close();
        void addPlaylistDB(Playlist);
        void addPlaylistInPlaylistDb(int);
        void addTrackDb(Track);
        void addTrackInPlaylistDb(int);

public:
        PlaylistDb();
        ~PlaylistDb();
        void addPlaylistInPlaylist(int,Playlist);
        void addTrackInPlaylist(int,Track);
//          void addTrack(int,Track);
//          void addTag(int,Tag);
//        bool updatePlaylistInPlaylist(PlaylistInPlaylist);
//        bool updatePlaylist(Playlist);
//        bool updateTrackInPlaylist(TrackInPlaylist);
//        bool updateTrack(Track);
//        bool updateTag(Tag);
//        bool deletePlaylistInPlaylist(PlaylistInPlaylist);
//        bool deletePlaylist(Playlist);
//        bool deleteTrackInPlaylist(TrackInPlaylist);
//        bool deleteTrack(Track);
//        bool deleteTag(Tag);
};

#endif // PLAYLISTDB_H






