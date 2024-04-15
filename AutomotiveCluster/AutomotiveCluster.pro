TEMPLATE = app
TARGET = AutomotiveCluster
INCLUDEPATH += cpp/headers

HEADERS += cpp/headers/*.h
SOURCES += cpp/sources/*.cpp

RESOURCES += \
    AutomotiveCluster.qrc \
    qml/mainfiles/mainfiles.qrc \
    qml/gui.qrc

QT += qml quick
