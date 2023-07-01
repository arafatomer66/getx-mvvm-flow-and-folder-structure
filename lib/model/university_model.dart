import 'dart:convert';

class University {
  String country;
  String name;
  dynamic stateProvince;
  List<String> domains;
  String alphaTwoCode;
  List<String> webPages;

  University({
    required this.country,
    required this.name,
    required this.stateProvince,
    required this.domains,
    required this.alphaTwoCode,
    required this.webPages,
  });

  factory University.fromRawJson(String str) => University.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory University.fromJson(Map<String, dynamic> json) => University(
    country: json["id"],
    name: json["name"],
    stateProvince: json["slug"],
    domains: json["featured"],
    alphaTwoCode: json["sort"],
    webPages: json["status"],
);

  Map<String, dynamic> toJson() => {
    "country": country,
    "name": name,
    "stateProvince": stateProvince,
    "domains": domains,
    "alphaTwoCode": alphaTwoCode,
    "webPages": webPages,
  };
}
