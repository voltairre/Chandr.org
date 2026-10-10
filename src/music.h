#pragma once

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>
#include <QUrl>
#include <QtQmlIntegration/qqmlintegration.h>

class Music: public QObject {
	Q_OBJECT
	QML_ELEMENT
	Q_PROPERTY(QUrl url READ url NOTIFY urlChanged)

	QNetworkAccessManager* manager = nullptr;
	QUrl m_url;

public:
	explicit Music(QObject* parent = nullptr);
	QUrl url() const;

signals:
	void urlChanged();

private slots:
	void replyFinished(QNetworkReply* reply);
};
