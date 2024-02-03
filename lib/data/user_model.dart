// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.address,
    this.name,
    this.time,
    this.type,
    this.number,
    this.image,
    this.bookappoinment,
    this.closeappoinment,
    this.id,
  });

  final String? address;
  final String? name;
  final String? time;
  final String? type;
  final String? number;
  final String? image;
  final List<dynamic>? bookappoinment;
  final List<dynamic>? closeappoinment;
  final String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        address: json["address"],
        name: json["name"],
        time: json["time"],
        type: json["type"],
        number: json["number"],
        image: json["image"],
        bookappoinment: json["bookappoinment"] == null
            ? []
            : List<dynamic>.from(json["bookappoinment"]!.map((x) => x)),
        closeappoinment: json["closeappoinment"] == null
            ? []
            : List<dynamic>.from(json["closeappoinment"]!.map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "time": time,
        "type": type,
        "number": number,
        "image": image,
        "bookappoinment": bookappoinment == null
            ? []
            : List<dynamic>.from(bookappoinment!.map((x) => x)),
        "closeappoinment": closeappoinment == null
            ? []
            : List<dynamic>.from(closeappoinment!.map((x) => x)),
        "id": id,
      };
}
