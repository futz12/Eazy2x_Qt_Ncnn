#ifndef HOME_H
#define HOME_H
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

class ui : public QObject {
    Q_OBJECT
public slots:
    void about();
    void setEngine(QQmlApplicationEngine &engine){_engine=&engine;};

private:
    QQmlApplicationEngine *_engine;
};

#endif // HOME_H
