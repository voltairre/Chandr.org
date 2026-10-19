#include "music.h"

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkRequest>

void Music::makeRequest() {
	QUrl url(
	    "https://www.youtube.com/youtubei/v1/"
	    "player?key=AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8"
	);
	QNetworkRequest request(url);

	request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

	QJsonObject json0 {{"clientName", "WEB"}, {"clientVersion", "2.20261016.01.00"}};

	QJsonObject json1 {{"client", json0}};

	QJsonObject json {{"videoId", videoId()}, {"context", json1}};

	QByteArray body = QJsonDocument(json).toJson();
	if (!videoId().isEmpty()) {
		manager->post(request, body);
	}
}

void Music::replyFinished(QNetworkReply *reply) {
	QByteArray data = reply->readAll();
	QJsonDocument doc = QJsonDocument::fromJson(data);
	QJsonObject obj = doc.object();
    qDebug().noquote() << data;
	if (m_url
	    != QUrl(obj["streamingData"].toObject()["formats"].toArray()[0].toObject()["url"].toString()))
	{
		m_url =
		    QUrl(obj["streamingData"].toObject()["formats"].toArray()[0].toObject()["url"].toString());
		emit urlChanged();
	}

	if (m_title != obj["videoDetails"].toObject()["title"].toString()) {
		m_title = obj["videoDetails"].toObject()["title"].toString();
		emit titleChanged();
	}

	if (m_author != obj["videoDetails"].toObject()["author"].toString().remove(" - Topic")) {
		m_author = obj["videoDetails"].toObject()["author"].toString().remove(" - Topic");
		emit authorChanged();
	}

	reply->deleteLater();
}

Music::Music(QObject *parent): QObject(parent), manager(new QNetworkAccessManager(this)) {
	connect(manager, &QNetworkAccessManager::finished, this, &Music::replyFinished);
	connect(this, &Music::videoIdChanged, this, &Music::reFetch);
	makeRequest();
}

QUrl Music::url() const { return m_url; }
QString Music::title() const { return m_title; }
QString Music::author() const { return m_author; }
QString Music::videoId() const { return m_videoId; }

void Music::setVideoId(const QString &videoId) {
	if (m_videoId != videoId) {
		m_videoId = videoId;
		emit videoIdChanged();
	}
}

void Music::reFetch() { makeRequest(); }

void Music::refresh() { makeRequest(); }
