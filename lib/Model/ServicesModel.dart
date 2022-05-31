// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) =>
    ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  ServicesModel({
    this.search,
    this.services,
    this.page,
    this.pageSize,
    this.pages,
  });

  String? search;
  List<Service>? services;
  int? page;
  int? pageSize;
  int? pages;

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        search: json["search"] == null ? null : json["search"],
        services: json["services"] == null
            ? null
            : List<Service>.from(
                json["services"].map((x) => Service.fromJson(x))),
        page: json["page"] == null ? null : json["page"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        pages: json["pages"] == null ? null : json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "search": search == null ? null : search,
        "services": services == null
            ? null
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        "page": page == null ? null : page,
        "pageSize": pageSize == null ? null : pageSize,
        "pages": pages == null ? null : pages,
      };
}

class Service {
  Service({
    this.id,
    this.user,
    this.title,
    this.description,
    this.category,
    this.subcategory,
    this.images,
    this.packages,
    this.rating,
    this.totalReview,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? user;
  String? title;
  String? description;
  String? category;
  String? subcategory;
  List<Image>? images;
  Packages? packages;
  double? rating;
  int? totalReview;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"] == null ? null : json["_id"],
        user: json["user"] == null ? null : json["user"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        subcategory: json["subcategory"] == null ? null : json["subcategory"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        packages: json["packages"] == null
            ? null
            : Packages.fromJson(json["packages"]),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        totalReview: json["totalReview"] == null ? null : json["totalReview"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "user": user == null ? null : user,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "subcategory": subcategory == null ? null : subcategory,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "packages": packages == null ? null : packages!.toJson(),
        "rating": rating == null ? null : rating,
        "totalReview": totalReview == null ? null : totalReview,
        "isActive": isActive == null ? null : isActive,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Image {
  Image({
    this.publicId,
    this.url,
  });

  String? publicId;
  String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: json["public_id"] == null ? null : json["public_id"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId == null ? null : publicId,
        "url": url == null ? null : url,
      };
}

class Packages {
  Packages({
    this.basic,
    this.standard,
    this.premium,
  });

  Basic? basic;
  Basic? standard;
  Basic? premium;

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        basic: json["basic"] == null ? null : Basic.fromJson(json["basic"]),
        standard:
            json["standard"] == null ? null : Basic.fromJson(json["standard"]),
        premium:
            json["premium"] == null ? null : Basic.fromJson(json["premium"]),
      );

  Map<String, dynamic> toJson() => {
        "basic": basic == null ? null : basic!.toJson(),
        "standard": standard == null ? null : standard!.toJson(),
        "premium": premium == null ? null : premium!.toJson(),
      };
}

class Basic {
  Basic({
    this.price,
    this.deliveryTime,
    this.revision,
  });

  int? price;
  int? deliveryTime;
  int? revision;

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
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
