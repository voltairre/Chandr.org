#pragma once

#include <QObject>
#include <QNetworkAccessManager>

class Youtube : public QObject
{
    Q_OBJECT
        Q_PROPERTY(QUrl url READ url NOTIFY urlChanged)

    public:
        explicit Youtube(QObject *parent = nullptr);

        QUrl url() const;

signals:
        void urlChanged();
};
