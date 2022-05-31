import 'dart:convert';



SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isPhoneVerified,
    this.image,
    this.role,
    this.wallet,
    this.widrowWallet,
    this.referralId,
    this.token,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  bool? isPhoneVerified;
  Image? image;
  List<String>? role;
  int? wallet;
  int? widrowWallet;
  String? referralId;
  String? token;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        isPhoneVerified:
            json["isPhoneVerified"] == null ? null : json["isPhoneVerified"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        role: json["role"] == null
            ? null
            : List<String>.from(json["role"].map((x) => x)),
        wallet: json["wallet"] == null ? null : json["wallet"],
        widrowWallet:
            json["widrowWallet"] == null ? null : json["widrowWallet"],
        referralId: json["referralId"] == null ? null : json["referralId"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "isPhoneVerified": isPhoneVerified == null ? null : isPhoneVerified,
        "image": image == null ? null : image!.toJson(),
        "role": role == null ? null : List<dynamic>.from(role!.map((x) => x)),
        "wallet": wallet == null ? null : wallet,
        "widrowWallet": widrowWallet == null ? null : widrowWallet,
        "referralId": referralId == null ? null : referralId,
        "token": token == null ? null : token,
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
