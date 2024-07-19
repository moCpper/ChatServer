-------------------------------------------------
#
# Project created by QtCreator 2024-02-27T14:01:20
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = llfcchat
TEMPLATE = app
RC_ICONS = icon.ico
DESTDIR = ./bin
# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        BubbleFrame.cpp \
        ChatItemBase.cpp \
        ChatView.cpp \
        MessageTextEdit.cpp \
        PictureBubble.cpp \
        TextBubble.cpp \
        adduseritem.cpp \
        applyfriend.cpp \
        applyfrienditem.cpp \
        applyfriendlist.cpp \
        applyfriendpage.cpp \
        authenfriend.cpp \
        chatdialog.cpp \
        chatpage.cpp \
        chatuserlist.cpp \
        chatuserwid.cpp \
        clickedbtn.cpp \
        clickedlabel.cpp \
        clickedoncelabel.cpp \
        contactuserlist.cpp \
        conuseritem.cpp \
        customizeedit.cpp \
        customizetextedit.cpp \
        findfaildlg.cpp \
        findsuccessdlg.cpp \
        friendlabel.cpp \
        global.cpp \
        grouptipitem.cpp \
        httpmgr.cpp \
        invaliditem.cpp \
        lineitem.cpp \
        listitembase.cpp \
        loadingdlg.cpp \
        logindialog.cpp \
        main.cpp \
        mainwindow.cpp \
        registerdialog.cpp \
        resetdialog.cpp \
        searchlist.cpp \
        statelabel.cpp \
        statewidget.cpp \
        tcpmgr.cpp \
        timerbtn.cpp \
        userdata.cpp \
        usermgr.cpp

HEADERS += \
        BubbleFrame.h \
        ChatItemBase.h \
        ChatView.h \
        MessageTextEdit.h \
        PictureBubble.h \
        TextBubble.h \
        adduseritem.h \
        applyfriend.h \
        applyfrienditem.h \
        applyfriendlist.h \
        applyfriendpage.h \
        authenfriend.h \
        chatdialog.h \
        chatpage.h \
        chatuserlist.h \
        chatuserwid.h \
        clickedbtn.h \
        clickedlabel.h \
        clickedoncelabel.h \
        contactuserlist.h \
        conuseritem.h \
        customizeedit.h \
        customizetextedit.h \
        findfaildlg.h \
        findsuccessdlg.h \
        friendlabel.h \
        global.h \
        grouptipitem.h \
        httpmgr.h \
        invaliditem.h \
        lineitem.h \
        listitembase.h \
        loadingdlg.h \
        logindialog.h \
        mainwindow.h \
        registerdialog.h \
        resetdialog.h \
        searchlist.h \
        singleton.h \
        statelabel.h \
        statewidget.h \
        tcpmgr.h \
        timerbtn.h \
        userdata.h \
        usermgr.h

FORMS += \
        adduseritem.ui \
        applyfriend.ui \
        applyfrienditem.ui \
        applyfriendpage.ui \
        authenfriend.ui \
        chatdialog.ui \
        chatpage.ui \
        chatuserwid.ui \
        conuseritem.ui \
        findfaildlg.ui \
        findsuccessdlg.ui \
        friendlabel.ui \
        grouptipitem.ui \
        lineitem.ui \
        loadingdlg.ui \
        logindialog.ui \
        mainwindow.ui \
        registerdialog.ui \
        resetdialog.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    rc.qrc

DISTFILES += \
    config.ini

CONFIG(debug, debug|release) {
        #debug
    message("debug mode")

    TargetConfig = $${PWD}/config.ini

    TargetConfig = $$replace(TargetConfig, /, \\)

    OutputDir =  $${OUT_PWD}/$${DESTDIR}
    OutputDir = $$replace(OutputDir, /, \\)
    //执行copy命令
    QMAKE_POST_LINK += copy /Y \"$$TargetConfig\" \"$$OutputDir\" &


    StaticDir = $${PWD}/static

    StaticDir = $$replace(StaticDir, /, \\)
    #message($${StaticDir})

     QMAKE_POST_LINK += xcopy /Y /E /I \"$$StaticDir\" \"$$OutputDir\\static\\\"
}else{
      #release
    message("release mode")

    TargetConfig = $${PWD}/config.ini

    TargetConfig = $$replace(TargetConfig, /, \\)

    OutputDir =  $${OUT_PWD}/$${DESTDIR}
    OutputDir = $$replace(OutputDir, /, \\)
    //执行copy命令
    QMAKE_POST_LINK += copy /Y \"$$TargetConfig\" \"$$OutputDir\"


    StaticDir = $${PWD}/static

    StaticDir = $$replace(StaticDir, /, \\)
    QMAKE_POST_LINK += xcopy /Y /E /I \"$$StaticDir\" \"$$OutputDir\\static\\\"
}

win32-msvc*:QMAKE_CXXFLAGS += /wd"4819" /utf-8
