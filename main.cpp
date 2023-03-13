#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "headers/language.h"
#include "headers/theme.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("themeColor", Theme(":/themes/themes/dark-purple.json").getColors());
    engine.rootContext()->setContextProperty("language", Language(":/languages/languages/uk_UA.json").getComponents());

    const QUrl url(u"qrc:/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
