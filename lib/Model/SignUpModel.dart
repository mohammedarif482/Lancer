// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.role,
    this.wallet,
    this.referralId,
    this.token,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  List<String>? role;
  int? wallet;
  String? referralId;
  String? token;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        image: json["image"] == null ? null : json["image"],
        role: json["role"] == null
            ? null
            : List<String>.from(json["role"].map((x) => x)),
        wallet: json["wallet"] == null ? null : json["wallet"],
        referralId: json["referralId"] == null ? null : json["referralId"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "image": image == null ? null : image,
        "role": role == null ? null : List<dynamic>.from(role!.map((x) => x)),
        "wallet": wallet == null ? null : wallet,
        "referralId": referralId == null ? null : referralId,
        "token": token == null ? null : token,
      };
}
