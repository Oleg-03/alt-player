#include "playlistDb.h"

PlaylistDb::PlaylistDb()
{
    this->path = "..\\alt-player\\Db_tyt\\dbdbdb.db";
}

PlaylistDb::~PlaylistDb()
{
    delete this->query;
}

bool PlaylistDb::open()
{
    return db.open();
}

void PlaylistDb::close()
{
    db.close();
}

void PlaylistDb::connection()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);
}

void PlaylistDb::addPlaylistDB(Playlist child_playlist)
{
    connection();
    db.open();
    query = new QSqlQuery();

    query->prepare(R"(
        INSERT INTO Playlist (
          playlist_name,
          creation_datetime,
          picture_path
        )
        VALUES (:n, :c, :p);
    )");

    query->bindValue(
        ":n", child_playlist.getName()
    );
    query->bindValue(
        ":c", child_playlist.getCreation()
    );
    query->bindValue(
        ":p", child_playlist.getPicturePath()
    );

    query->exec();

    db.close();
}

void PlaylistDb::addPlaylistInPlaylistDb(int parent_id)
{
    connection();
    db.open();
    query = new QSqlQuery();

    query->prepare(R"(
        INSERT INTO Playlist_in_playlist (
            fk_parent_playlist_id,
            fk_child_playlist_id
        )
        VALUES (
            :p,
            (SELECT playlist_id
              FROM Playlist
              ORDER BY playlist_id
              DESC LIMIT 1)
        );
    )");

    query->bindValue(":p", parent_id);

    query->exec();
    db.close();
}

void PlaylistDb::addPlaylistInPlaylist(int parent_id, Playlist child_playlist)
{
    addPlaylistDB(child_playlist);

    addPlaylistInPlaylistDb(parent_id);

    for (Playlist& item : playlists)
    {
        if (item.getId() == parent_id)
        {
            item.newPlaylist(child_playlist);
        }

    }
}

void PlaylistDb::addTrackDb(Track child_track)
{
    connection();
    db.open();
    query = new QSqlQuery();

    query->prepare(R"(
        INSERT INTO Trackes (
            track_name,
            title,
            author,
            file_path
        )
        VALUES (:n, :t, :a, :p);
    )");
    query->bindValue(":n", child_track.getName());
    query->bindValue(":t", child_track.getTitle());
    query->bindValue(":a", child_track.getAuthor());
    query->bindValue(":p", child_track.getPath());

    query->exec();
    db.close();
}

void PlaylistDb::addTrackInPlaylistDb(int parent_id)
{
    connection();
    db.open();
    query = new QSqlQuery();

    query->prepare(R"(
        INSERT INTO Track_in_playlist (
            fk_parent_playlist_id,
            fk_track_id
        )
        VALUES (
            :p,
            (SELECT track_id
              FROM Trackes
              ORDER BY track_id
              DESC LIMIT 1)
        );
    )");

    query->bindValue(":p", parent_id);
    query->exec();
    db.close();
}

void PlaylistDb::addTrackInPlaylist(int parent_id, Track child_track)
{
    addTrackDb(child_track);

    addTrackInPlaylistDb(parent_id);

    for (Playlist& item : playlists)
    {
        if (item.getId() == parent_id)
        {
            item.newTrack(child_track);
        }

    }

}


