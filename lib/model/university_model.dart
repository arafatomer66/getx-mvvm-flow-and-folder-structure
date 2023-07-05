import 'dart:convert';

class University {
  String? country;
  String? name;
  dynamic stateProvince;
  List<String>? domains;
  String? alphaTwoCode;
  List<String>? webPages;

  University({
    this.country,
    this.name,
    this.stateProvince,
    this.domains,
    this.alphaTwoCode,
    this.webPages,
  });

  factory University.fromRawJson(String str) => University.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory University.fromJson(Map<String, dynamic> json) => University(
    country: json["country"],
    name: json["name"],
    stateProvince: json["stateProvince"],
    domains: List<String>.from(json["domains"]!.map((x) => x)),
    alphaTwoCode: json["alphaTwoCode"],
    webPages:  List<String>.from(json["web_pages"]!.map((x) => x)),
);

  Map<String, dynamic> toJson() => {
    "country": country,
    "name": name,
    "stateProvince": stateProvince,
    "domains": List<dynamic>.from(domains!.map((x) => x)),
    "alphaTwoCode": alphaTwoCode,
    "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
  };
}
