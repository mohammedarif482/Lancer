
import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.id,
    this.title,
    this.description,
    this.image,
    this.v,
  });

  String? id;
  String? title;
  String? description;
  Pic? image;
  int? v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : Pic.fromJson(json["image"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "image": image == null ? null : image!.toJson(),
        "__v": v == null ? null : v,
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
