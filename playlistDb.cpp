#include "playlistDb.h"

PlaylistDb::PlaylistDb()
{

}

PlaylistDb::~PlaylistDb()
{
    delete this->query;
}

QSqlDatabase PlaylistDb::open()
{
    QSqlDatabase& db = Database::getDBInstance();
    return db;
}

void PlaylistDb::close()
{
    Database::disconnect();
}

void PlaylistDb::addPlaylistDB(Playlist child_playlist)
{
    open();
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

    close();
}

void PlaylistDb::addPlaylistInPlaylistDb(int parent_id)
{
    open();
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
    close();
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

void PlaylistDb::addTrackInPlaylistDb(int parent_id, int track_id)
{
    open();
    query = new QSqlQuery();

    query->prepare(R"(
        INSERT INTO Track_in_playlist (
            fk_parent_playlist_id,
            fk_track_id
        )
        VALUES (:p, :t);
    )");

    query->bindValue(":p", parent_id);
    query->bindValue(":t", track_id);
    query->exec();
    close();
}

void PlaylistDb::addTrackInPlaylist(int parent_id, Track child_track)
{

    addTrackInPlaylistDb(parent_id, child_track_id);

    for (Playlist& item : playlists)
    {
        if (item.getId() == parent_id)
        {
            item.newTrack(child_track);
            deleteTrackInPlaylist(parent_id, child_track);
            return true;
        }        
    }
    return false;
}

void PlaylistDb::deleteTrackInPlaylist(int, Track)
{

}

bool PlaylistDb::isTrackExists(int id)
{
    open();
    query = new QSqlQuery;

    query->prepare(R"(
        SELECT COUNT(*)
          FROM Trackes
          WHERE track_id = :id;
    )");

    query->bindValue(":id", id);

    query->exec();
    query->next();
    int count = query->value(0).toInt();
    close();

    return count > 0? true : false;
}

void PlaylistDb::addTrack(Track track)
{
    if (!isTrackExists(track.getId()))
    {
        open();
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
        query->bindValue(":n", track.getName());
        query->bindValue(":t", track.getTitle());
        query->bindValue(":a", track.getAuthor());
        query->bindValue(":p", track.getPath());

        query->exec();
        close();
        addTrackInPlaylist(1, track);
        return true;
    }
    else return false;

}

bool PlaylistDb::isTagExists(QString name)
{
    open();
    query = new QSqlQuery;

    query->prepare(R"(
        SELECT COUNT(*)
          FROM Tags
          WHERE tag_name = :name;
    )");

    query->bindValue(":name", name);

    query->exec();
    query->next();
    int count = query->value(0).toInt();
    close();

    return count > 0? true : false;
}

bool PlaylistDb::addTag(Tag tag)
{
    if (!isTagExists(tag.getName()))
    {
        open();
        query = new QSqlQuery;

        query->prepare(R"(
            INSERT INTO Tags (
                tag_name,
                tag_color
            )
            VALUES (:n, :c);
        )");

        query->bindValue(":n", tag.getName());
        query->bindValue(":c", tag.getColor());

        query->exec();
        close();
        return true;
    }
    else return false;
}






