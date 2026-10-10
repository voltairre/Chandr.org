#include "music.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkReply>
#include <QNetworkRequest>

void Music::replyFinished(QNetworkReply* reply) {
	QByteArray data = reply->readAll();
	QJsonDocument doc = QJsonDocument::fromJson(data);
	QJsonObject obj = doc.object();
	qDebug().noquote() << QJsonDocument(obj).toJson();
}

Music::Music(QObject* parent): QObject(parent), manager(new QNetworkAccessManager(this)) {
	connect(manager, &QNetworkAccessManager::finished, this, &Music::replyFinished);

	QUrl url(
	    "https://www.youtube.com/youtubei/v1/"
	    "player?key=AIzaSyA8eiZmM1FaDVjRy-df2KTyQ_vz_yYM39w"
	);
	QNetworkRequest request(url);

	request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

	QJsonObject json0 {
	    {"clientName", "ANDROID"},
	    {"clientVersion", "21.26.364"},
	    {"androidSdkVersion", 30}
	};

	QJsonObject json1 {{"client", json0}};

	QJsonObject json {{"videoId", "1fJQCPMd8pc"}, {"context", json1}};

	QByteArray body = QJsonDocument(json).toJson();

	QNetworkReply* reply = manager->post(request, body);
}

QUrl Music::url() const { return m_url; }
