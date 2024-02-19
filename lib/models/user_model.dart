// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  dynamic location;
  dynamic title;
  dynamic description;
  dynamic tags;
  dynamic avatar;
  dynamic language;
  dynamic tfaSecret;
  String? status;
  String? role;
  dynamic token;
  DateTime? lastAccess;
  String? lastPage;
  String? provider;
  dynamic externalIdentifier;
  dynamic authData;
  bool? emailNotifications;
  dynamic appearance;
  dynamic themeDark;
  dynamic themeLight;
  dynamic themeLightOverrides;
  dynamic themeDarkOverrides;
  dynamic profilePicture;
  String? authType;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.location,
    this.title,
    this.description,
    this.tags,
    this.avatar,
    this.language,
    this.tfaSecret,
    this.status,
    this.role,
    this.token,
    this.lastAccess,
    this.lastPage,
    this.provider,
    this.externalIdentifier,
    this.authData,
    this.emailNotifications,
    this.appearance,
    this.themeDark,
    this.themeLight,
    this.themeLightOverrides,
    this.themeDarkOverrides,
    this.profilePicture,
    this.authType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        location: json["location"],
        title: json["title"],
        description: json["description"],
        tags: json["tags"],
        avatar: json["avatar"],
        language: json["language"],
        tfaSecret: json["tfa_secret"],
        status: json["status"],
        role: json["role"],
        token: json["token"],
        lastAccess: json["last_access"] == null
            ? null
            : DateTime.parse(json["last_access"]),
        lastPage: json["last_page"],
        provider: json["provider"],
        externalIdentifier: json["external_identifier"],
        authData: json["auth_data"],
        emailNotifications: json["email_notifications"],
        appearance: json["appearance"],
        themeDark: json["theme_dark"],
        themeLight: json["theme_light"],
        themeLightOverrides: json["theme_light_overrides"],
        themeDarkOverrides: json["theme_dark_overrides"],
        profilePicture: json["profile_picture"],
        authType: json["auth_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "location": location,
        "title": title,
        "description": description,
        "tags": tags,
        "avatar": avatar,
        "language": language,
        "tfa_secret": tfaSecret,
        "status": status,
        "role": role,
        "token": token,
        "last_access": lastAccess?.toIso8601String(),
        "last_page": lastPage,
        "provider": provider,
        "external_identifier": externalIdentifier,
        "auth_data": authData,
        "email_notifications": emailNotifications,
        "appearance": appearance,
        "theme_dark": themeDark,
        "theme_light": themeLight,
        "theme_light_overrides": themeLightOverrides,
        "theme_dark_overrides": themeDarkOverrides,
        "profile_picture": profilePicture,
        "auth_type": authType,
      };
}
