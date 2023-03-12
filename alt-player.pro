QT += quick sql core multimedia svg

SOURCES += \
    main.cpp \
    theme.cpp

RESOURCES += \
    resurces.qrc

TRANSLATIONS += \
    alt-player_uk_UA.ts
CONFIG += \
    lrelease \
    embed_translations

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    theme.h
