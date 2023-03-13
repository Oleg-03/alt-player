#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLocale>
#include <QTranslator>
#include <QQmlContext>

#include "headers/language.h"
#include "headers/theme.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "alt-player_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

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
