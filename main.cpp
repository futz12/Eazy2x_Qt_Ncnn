#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <opencv2/core.hpp>
#include "ui.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    ui _ui;
    _ui.setEngine(engine);

    //  将这个 C++ 实例注册到 Qml 引擎 “myObject”为在QML中调用的名称
    engine.rootContext()->setContextProperty("ui",&_ui);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
