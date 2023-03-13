QT += quick sql core multimedia

HEADERS += \
    headers/database.h \
    headers/playlistDb.h \
    headers/tag.h \
    headers/playlist.h \
    headers/track.h

SOURCES += \
    main.cpp \
    sources/database.cpp \
    sources/playlistDb.cpp \
    sources/playlist.cpp \
    sources/tag.cpp \
    sources/track.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
