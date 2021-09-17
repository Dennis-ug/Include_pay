// To parse this JSON data, do
//
//     final SaccoSearch = SaccoSearchFromJson(jsonString);

import 'dart:convert';

SaccoSearch saccoSearchFromJson(String str) =>
    SaccoSearch.fromJson(json.decode(str));

String saccoSearchToJson(SaccoSearch data) => json.encode(data.toJson());

class SaccoSearch {
  late List<Sacco> saccos;
  SaccoSearch({
    required this.saccos,
  });

  factory SaccoSearch.fromJson(Map<String, dynamic> json) => SaccoSearch(
        saccos: List<Sacco>.from(json["saccos"].map((x) => Sacco.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "saccos": List<dynamic>.from(saccos.map((x) => x.toJson())),
      };
}

class Sacco {
  Sacco({
    required this.id,
    required this.name,
    required this.logo,
  });

  String id;
  String name;
  String logo;

  factory Sacco.fromJson(Map<String, dynamic> json) => Sacco(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
