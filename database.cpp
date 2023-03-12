#include "database.h"

Database::Database()
    {  }
QSqlDatabase &Database::getDBInstance()
{
    static QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("..\\alt-player\\databases\\database.db");
    if (!db.open()) {
        qDebug() << "Failed to connect to database!";
    }
    return db;
}

void Database::disconnect()
{
    QSqlDatabase::database().close();
}
