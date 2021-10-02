// To parse this JSON data, do
//
//     final axies = axiesFromJson(jsonString);

import 'dart:convert';

class Axies {
  Axies({
    required this.ownerAddress,
    required this.availableAxies,
  });

  String ownerAddress;
  AvailableAxies availableAxies;

  factory Axies.fromRawJson(String str) => Axies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Axies.fromJson(Map<String, dynamic> json) => Axies(
        ownerAddress: json["owner_address"],
        availableAxies: AvailableAxies.fromJson(json["available_axies"]),
      );

  Map<String, dynamic> toJson() => {
        "owner_address": ownerAddress,
        "available_axies": availableAxies.toJson(),
      };
}

class AvailableAxies {
  AvailableAxies({
    required this.total,
    required this.results,
  });

  int total;
  List<Result> results;

  factory AvailableAxies.fromRawJson(String str) =>
      AvailableAxies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvailableAxies.fromJson(Map<String, dynamic> json) => AvailableAxies(
        total: json["total"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.stage,
    required this.resultClass,
    required this.breedCount,
    required this.image,
    required this.title,
    required this.battleInfo,
    required this.auction,
    required this.stats,
    required this.parts,
  });

  String id;
  String name;
  int stage;
  String resultClass;
  int breedCount;
  String image;
  String title;
  BattleInfo battleInfo;
  dynamic auction;
  Stats stats;
  List<Part> parts;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        stage: json["stage"],
        resultClass: json["class"],
        breedCount: json["breedCount"],
        image: json["image"],
        title: json["title"],
        battleInfo: BattleInfo.fromJson(json["battleInfo"]),
        auction: json["auction"],
        stats: Stats.fromJson(json["stats"]),
        parts: List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stage": stage,
        "class": classValues.reverse[resultClass],
        "breedCount": breedCount,
        "image": image,
        "title": title,
        "battleInfo": battleInfo.toJson(),
        "auction": auction,
        "stats": stats.toJson(),
        "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
      };
}

class BattleInfo {
  BattleInfo({
    required this.banned,
  });

  bool banned;

  factory BattleInfo.fromRawJson(String str) =>
      BattleInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BattleInfo.fromJson(Map<String, dynamic> json) => BattleInfo(
        banned: json["banned"],
      );

  Map<String, dynamic> toJson() => {
        "banned": banned,
      };
}

class Part {
  Part({
    required this.id,
    required this.name,
    required this.partClass,
    required this.type,
    required this.specialGenes,
  });

  String id;
  String name;
  String partClass;
  String type;
  dynamic specialGenes;

  factory Part.fromRawJson(String str) => Part.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        id: json["id"],
        name: json["name"],
        partClass: json["class"],
        type: json["type"],
        specialGenes: json["specialGenes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "class": classValues.reverse[partClass],
        "type": type,
        "specialGenes": specialGenes,
      };
}

enum Class { AQUATIC, PLANT, BEAST }

final classValues = EnumValues(
    {"Aquatic": Class.AQUATIC, "Beast": Class.BEAST, "Plant": Class.PLANT});

class Stats {
  Stats({
    required this.hp,
    required this.speed,
    required this.skill,
    required this.morale,
  });

  int hp;
  int speed;
  int skill;
  int morale;

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        hp: json["hp"],
        speed: json["speed"],
        skill: json["skill"],
        morale: json["morale"],
      );

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "speed": speed,
        "skill": skill,
        "morale": morale,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
