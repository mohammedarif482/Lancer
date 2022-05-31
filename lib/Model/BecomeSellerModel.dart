// To parse this JSON data, do
//
//     final becomeSellerModel = becomeSellerModelFromJson(jsonString);

import 'dart:convert';

BecomeSellerModel becomeSellerModelFromJson(String str) =>
    BecomeSellerModel.fromJson(json.decode(str));

String becomeSellerModelToJson(BecomeSellerModel data) =>
    json.encode(data.toJson());

class BecomeSellerModel {
  BecomeSellerModel({
    this.description,
    this.personalWebsite,
    this.certifications,
    this.skills,
  });

  String? description;
  String? personalWebsite;
  List<Certification>? certifications;
  List<Skill>? skills;

  factory BecomeSellerModel.fromJson(Map<String, dynamic> json) =>
      BecomeSellerModel(
        description: json["description"] == null ? null : json["description"],
        personalWebsite:
            json["personalWebsite"] == null ? null : json["personalWebsite"],
        certifications: json["certifications"] == null
            ? null
            : List<Certification>.from(
                json["certifications"].map((x) => Certification.fromJson(x))),
        skills: json["skills"] == null
            ? null
            : List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "personalWebsite": personalWebsite == null ? null : personalWebsite,
        "certifications": certifications == null
            ? null
            : List<dynamic>.from(certifications!.map((x) => x.toJson())),
        "skills": skills == null
            ? null
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
      };
}

class Certification {
  Certification({
    this.title,
    this.certifiedBy,
    this.year,
  });

  String? title;
  String? certifiedBy;
  String? year;

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        title: json["title"] == null ? null : json["title"],
        certifiedBy: json["certifiedBy"] == null ? null : json["certifiedBy"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "certifiedBy": certifiedBy == null ? null : certifiedBy,
        "year": year == null ? null : year,
      };
}

class Skill {
  Skill({
    this.title,
    this.level,
  });

  String? title;
  String? level;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        title: json["title"] == null ? null : json["title"],
        level: json["level"] == null ? null : json["level"],
      );

  Map<String, dynamic> toJson() => {
        "title": title ?? null,
        "level": level ?? null,
      };
}
