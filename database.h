#ifndef DATABASE_H
#define DATABASE_H

#include <QSqlDatabase>
#include <QDebug>

class Database {
    public:
    // call connection: QSqlDatabase& db = Database::getDBInstance();
        static QSqlDatabase& getDBInstance();
    // call disconnect: Database::disconnect();
        static void disconnect();
    private:
        Database();
};

#endif // DATABASE_H





