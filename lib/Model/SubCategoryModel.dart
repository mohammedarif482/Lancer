// To parse this JSON data, do
//
//     final subCategory = subCategoryFromJson(jsonString);

import 'dart:convert';

SubCategory subCategoryFromJson(String str) =>
    SubCategory.fromJson(json.decode(str));

String subCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  SubCategory({
    this.id,
    this.title,
    this.description,
    this.pic,
    this.v,
    this.subcategory,
  });

  String? id;
  String? title;
  String? description;
  Pic? pic;
  int? v;
  List<Subcategory>? subcategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        pic: json["image"] == null ? null : Pic.fromJson(json["image"]),
        v: json["__v"] == null ? null : json["__v"],
        subcategory: json["subcategory"] == null
            ? null
            : List<Subcategory>.from(
                json["subcategory"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "image": pic == null ? null : pic!.toJson(),
        "__v": v == null ? null : v,
        "subcategory": subcategory == null
            ? null
            : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
      };
}

class Pic {
  Pic({
    this.publicId,
    this.url,
  });

  String? publicId;
  String? url;

  factory Pic.fromJson(Map<String, dynamic> json) => Pic(
        publicId: json["public_id"] == null ? null : json["public_id"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId == null ? null : publicId,
        "url": url == null ? null : url,
      };
}

class Subcategory {
  Subcategory({
    this.id,
    this.title,
    this.description,
    this.v,
  });

  String? id;
  String? title;
  String? description;
  int? v;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "__v": v == null ? null : v,
      };
}
