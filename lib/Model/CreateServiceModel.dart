// To parse this JSON data, do
//
//     final createService = createServiceFromJson(jsonString);

import 'dart:convert';

CreateServiceModel createServiceFromJson(String str) =>
    CreateServiceModel.fromJson(json.decode(str));

String createServiceToJson(CreateServiceModel data) =>
    json.encode(data.toJson());

class CreateServiceModel {
  CreateServiceModel({
    this.title,
    this.description,
    this.category,
    this.subcategory,
    this.images,
    this.packages,
  });

  String? title;
  String? description;
  String? category;
  String? subcategory;
  List<Images>? images;
  Packages? packages;

  factory CreateServiceModel.fromJson(Map<String, dynamic> json) =>
      CreateServiceModel(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        subcategory: json["subcategory"] == null ? null : json["subcategory"],
        images: json["images"] == null
            ? null
            : List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        packages: json["packages"] == null
            ? null
            : Packages.fromJson(json["packages"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "subcategory": subcategory == null ? null : subcategory,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "packages": packages == null ? null : packages!.toJson(),
      };
}

class Images {
  Images({
    this.publicId,
    this.url,
  });

  String? publicId;
  String? url;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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
  Standard? standard;
  Premium? premium;

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        basic: json["basic"] == null ? null : Basic.fromJson(json["basic"]),
        standard: json["standard"] == null
            ? null
            : Standard.fromJson(json["standard"]),
        premium:
            json["premium"] == null ? null : Premium.fromJson(json["premium"]),
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

class Standard {
  Standard({
    this.price,
    this.deliveryTime,
    this.revision,
  });

  int? price;
  int? deliveryTime;
  int? revision;

  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
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

class Premium {
  Premium({
    this.price,
    this.deliveryTime,
    this.revision,
  });

  int? price;
  int? deliveryTime;
  int? revision;

  factory Premium.fromJson(Map<String, dynamic> json) => Premium(
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
