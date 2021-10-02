// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

class Account {
  Account({
    required this.cacheLastUpdated,
    required this.drawTotal,
    required this.loseTotal,
    required this.winTotal,
    required this.totalMatches,
    required this.winRate,
    required this.mmr,
    required this.rank,
    required this.roninSlp,
    required this.totalSlp,
    required this.inGameSlp,
    required this.lastClaim,
    required this.lifetimeSlp,
    required this.name,
    required this.nextClaim,
  });

  int cacheLastUpdated;
  int drawTotal;
  int loseTotal;
  int winTotal;
  int totalMatches;
  int winRate;
  int mmr;
  int rank;
  int roninSlp;
  int totalSlp;
  int inGameSlp;
  int lastClaim;
  int lifetimeSlp;
  String name;
  int nextClaim;

  factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        cacheLastUpdated: json["cache_last_updated"],
        drawTotal: json["draw_total"],
        loseTotal: json["lose_total"],
        winTotal: json["win_total"],
        totalMatches: json["total_matches"],
        winRate: json["win_rate"],
        mmr: json["mmr"],
        rank: json["rank"],
        roninSlp: json["ronin_slp"],
        totalSlp: json["total_slp"],
        inGameSlp: json["in_game_slp"],
        lastClaim: json["last_claim"],
        lifetimeSlp: json["lifetime_slp"],
        name: json["name"],
        nextClaim: json["next_claim"],
      );

  Map<String, dynamic> toJson() => {
        "cache_last_updated": cacheLastUpdated,
        "draw_total": drawTotal,
        "lose_total": loseTotal,
        "win_total": winTotal,
        "total_matches": totalMatches,
        "win_rate": winRate,
        "mmr": mmr,
        "rank": rank,
        "ronin_slp": roninSlp,
        "total_slp": totalSlp,
        "in_game_slp": inGameSlp,
        "last_claim": lastClaim,
        "lifetime_slp": lifetimeSlp,
        "name": name,
        "next_claim": nextClaim,
      };
}
