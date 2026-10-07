#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include "youtube.hpp"

Youtube::Youtube(QObject *parent) : QObject(parent) {
    QNetworkAccessManager(this) manager
        QUrl url("");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader("Accept", "application/json");

    QJsonObject json;
    json["name"] = "John";
    json["age"] = 30;

    QJsonDocument doc(json);
    QByteArray data = doc.toJson(QJsonDocument::Compact);
}

QUrl Youtube::url() const {
    QNetworkReply *reply = Youtube::manager->post(request, data);

    connect(reply, &QNetworkReply::finished, this, [reply]() {
            if (reply->error() == QNetworkReply::NoError) {
            qDebug() << "Response:" << reply->readAll();
            } else {
            qDebug() << "Error:" << reply->errorString();
            }

            reply->deleteLater();
            }
