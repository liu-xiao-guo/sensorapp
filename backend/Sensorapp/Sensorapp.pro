TEMPLATE = lib
TARGET = Sensorappbackend
QT += qml quick
CONFIG += qt plugin c++11

load(ubuntu-click)

TARGET = $$qtLibraryTarget($$TARGET)

# Input
SOURCES += \
    backend.cpp \
    mytype.cpp \
    qpscaleengine.cpp \
    qpplotitem.cpp \
    qptightscaleengine.cpp \
    qpcurve.cpp \
    qpscrollingcurve.cpp \
    qpfixedscaleengine.cpp

HEADERS += \
    backend.h \
    mytype.h \
    qpscaleengine.h \
    qpplotitem.h \
    qptightscaleengine.h \
    qpcurve.h \
    qpscrollingcurve.h \
    qpfixedscaleengine.h

OTHER_FILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
installPath = $${UBUNTU_CLICK_PLUGIN_PATH}/Sensorapp
qmldir.path = $$installPath
target.path = $$installPath
INSTALLS += target qmldir


