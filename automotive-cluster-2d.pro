TEMPLATE = app
TARGET = automotive-cluster-2d
INCLUDEPATH += cpp/headers

HEADERS += cpp/headers/*.h
SOURCES += cpp/sources/*.cpp

RESOURCES += \
    automotive-cluster-2d.qrc \
    qml/mainfiles/mainfiles.qrc \
    qml/gui.qrc

QT += qml quick

unix:!macx {
    isEmpty(PREFIX): PREFIX = /usr
    DATADIR = $${PREFIX}/share
    BINDIR = $${PREFIX}/bin
    LIBDIR = $${PREFIX}/lib
    INCLUDEDIR = $${PREFIX}/include

    target.path = $${BINDIR}

    INSTALLS += target
}
