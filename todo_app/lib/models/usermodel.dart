
import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
    String? id;
    String? name;
    String? email;
    int? phone;
    String? address;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    ContactModel({
         this.id,
         this.name,
         this.email,
         this.phone,
         this.address,
         this.createdAt,
         this.updatedAt,
         this.v,
    });

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}