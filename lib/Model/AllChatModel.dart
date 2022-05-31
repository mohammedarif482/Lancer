// To parse this JSON data, do
//
//     final allChatApi = allChatApiFromJson(jsonString);

import 'dart:convert';

List<AllChatModel> allChatApiFromJson(String str) =>
    List<AllChatModel>.from(json.decode(str).map((x) => AllChatModel.fromJson(x)));

String allChatApiToJson(List<AllChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllChatModel {
  AllChatModel({
    this.id,
    this.members,
    this.order,
    this.package,
    this.isOrdered,
    this.isNegotiated,
    this.negotiatedPrice,
    this.negotiatedRevision,
    this.negotiatedDeliveryTime,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMessage,
  });

  String? id;
  List<Member>? members;
  Order? order;
  Package? package;
  bool? isOrdered;
  bool? isNegotiated;
  int? negotiatedPrice;
  int? negotiatedRevision;
  int? negotiatedDeliveryTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  LastMessage? lastMessage;

  factory AllChatModel.fromJson(Map<String, dynamic> json) => AllChatModel(
        id: json["_id"] == null ? null : json["_id"],
        members: json["members"] == null
            ? null
            : List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        package:
            json["package"] == null ? null : Package.fromJson(json["package"]),
        isOrdered: json["isOrdered"] == null ? null : json["isOrdered"],
        isNegotiated:
            json["isNegotiated"] == null ? null : json["isNegotiated"],
        negotiatedPrice:
            json["negotiatedPrice"] == null ? null : json["negotiatedPrice"],
        negotiatedRevision: json["negotiatedRevision"] == null
            ? null
            : json["negotiatedRevision"],
        negotiatedDeliveryTime: json["negotiatedDeliveryTime"] == null
            ? null
            : json["negotiatedDeliveryTime"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        lastMessage: json["lastMessage"] == null
            ? null
            : LastMessage.fromJson(json["lastMessage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "members": members == null
            ? null
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "order": order == null ? null : order!.toJson(),
        "package": package == null ? null : package!.toJson(),
        "isOrdered": isOrdered == null ? null : isOrdered,
        "isNegotiated": isNegotiated == null ? null : isNegotiated,
        "negotiatedPrice": negotiatedPrice == null ? null : negotiatedPrice,
        "negotiatedRevision":
            negotiatedRevision == null ? null : negotiatedRevision,
        "negotiatedDeliveryTime":
            negotiatedDeliveryTime == null ? null : negotiatedDeliveryTime,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
        "lastMessage": lastMessage == null ? null : lastMessage!.toJson(),
      };
}

class LastMessage {
  LastMessage({
    this.chat,
    this.sender,
    this.receiver,
    this.type,
    this.description,
    this.acceptStatus,
    this.price,
    this.revision,
    this.deliveryTime,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? chat;
  String? sender;
  String? receiver;
  String? type;
  String? description;
  String? acceptStatus;
  int? price;
  int? revision;
  int? deliveryTime;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        chat: json["chat"] == null ? null : json["chat"],
        sender: json["sender"] == null ? null : json["sender"],
        receiver: json["receiver"] == null ? null : json["receiver"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        acceptStatus:
            json["acceptStatus"] == null ? null : json["acceptStatus"],
        price: json["price"] == null ? null : json["price"],
        revision: json["revision"] == null ? null : json["revision"],
        deliveryTime:
            json["deliveryTime"] == null ? null : json["deliveryTime"],
        id: json["_id"] == null ? null : json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "chat": chat == null ? null : chat,
        "sender": sender == null ? null : sender,
        "receiver": receiver == null ? null : receiver,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "acceptStatus": acceptStatus == null ? null : acceptStatus,
        "price": price == null ? null : price,
        "revision": revision == null ? null : revision,
        "deliveryTime": deliveryTime == null ? null : deliveryTime,
        "_id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Member {
  Member({
    this.id,
    this.name,
    this.image,
  });

  String? id;
  String? name;
  Image? image;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image!.toJson(),
      };
}

class Image {
  Image({
    this.url,
  });

  String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
      };
}

class Order {
  Order({
    this.buyer,
    this.seller,
    this.service,
    this.package,
  });

  String? buyer;
  String? seller;
  String? service;
  String? package;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        buyer: json["buyer"] == null ? null : json["buyer"],
        seller: json["seller"] == null ? null : json["seller"],
        service: json["service"] == null ? null : json["service"],
        package: json["package"] == null ? null : json["package"],
      );

  Map<String, dynamic> toJson() => {
        "buyer": buyer == null ? null : buyer,
        "seller": seller == null ? null : seller,
        "service": service == null ? null : service,
        "package": package == null ? null : package,
      };
}

class Package {
  Package({
    this.price,
    this.deliveryTime,
    this.revision,
  });

  int? price;
  int? deliveryTime;
  int? revision;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        price: json["price"] == null ? null : json["price"],
        deliveryTime:
            json["deliveryTime"] == null ? null : json["deliveryTime"],
        revision: json["revision"] == null ? null : json["revision"],
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price,
        "deliveryTime": deliveryTime == null ? null : deliveryTime,
        "revision": revision == null ? null : revision,
      };
}
