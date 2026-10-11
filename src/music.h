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
	Q_PROPERTY(QString title READ title NOTIFY titleChanged)
	Q_PROPERTY(QString author READ author NOTIFY authorChanged)
	Q_PROPERTY(QString videoId READ videoId WRITE setVideoId NOTIFY videoIdChanged REQUIRED)

	QNetworkAccessManager* manager = nullptr;
	QUrl m_url;
	QString m_title;
	QString m_author;
	QString m_videoId;

	void makeRequest();

public:
	explicit Music(QObject* parent = nullptr);
	QUrl url() const;
	QString title() const;
	QString author() const;
	QString videoId() const;

	void setVideoId(const QString& videoId);

	Q_INVOKABLE void refresh();

signals:
	void urlChanged();
	void titleChanged();
	void authorChanged();
	void videoIdChanged();

private slots:
	void replyFinished(QNetworkReply* reply);
	void reFetch();
};
