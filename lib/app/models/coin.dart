// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

class Coin {
  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.assetPlatformId,
    required this.platforms,
    required this.blockTimeInMinutes,
    required this.hashingAlgorithm,
    required this.categories,
    required this.publicNotice,
    required this.additionalNotices,
    required this.localization,
    required this.description,
    required this.links,
    required this.image,
    required this.countryOrigin,
    required this.genesisDate,
    required this.contractAddress,
    required this.sentimentVotesUpPercentage,
    required this.sentimentVotesDownPercentage,
    required this.marketCapRank,
    required this.coingeckoRank,
    required this.coingeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.marketData,
    required this.publicInterestStats,
    required this.statusUpdates,
    required this.lastUpdated,
  });

  final String id;
  final String symbol;
  final String name;
  final String? assetPlatformId;
  final Platforms platforms;
  final int blockTimeInMinutes;
  final dynamic hashingAlgorithm;
  final List<String> categories;
  final dynamic publicNotice;
  final List<dynamic> additionalNotices;
  final Tion localization;
  final Tion description;
  final Links links;
  final Image image;
  final String countryOrigin;
  final dynamic genesisDate;
  final String? contractAddress;
  final double sentimentVotesUpPercentage;
  final double sentimentVotesDownPercentage;
  final int marketCapRank;
  final int coingeckoRank;
  final double coingeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final MarketData marketData;
  final PublicInterestStats publicInterestStats;
  final List<dynamic> statusUpdates;
  final DateTime lastUpdated;

  factory Coin.fromRawJson(String str) => Coin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        platforms: Platforms.fromJson(json["platforms"]),
        blockTimeInMinutes: json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices:
            List<dynamic>.from(json["additional_notices"].map((x) => x)),
        localization: Tion.fromJson(json["localization"]),
        description: Tion.fromJson(json["description"]),
        links: Links.fromJson(json["links"]),
        image: Image.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: json["genesis_date"],
        contractAddress: json["contract_address"],
        sentimentVotesUpPercentage:
            json["sentiment_votes_up_percentage"].toDouble(),
        sentimentVotesDownPercentage:
            json["sentiment_votes_down_percentage"].toDouble(),
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"].toDouble(),
        developerScore: json["developer_score"],
        communityScore: json["community_score"].toDouble(),
        liquidityScore: json["liquidity_score"].toDouble(),
        publicInterestScore: json["public_interest_score"],
        marketData: MarketData.fromJson(json["market_data"]),
        publicInterestStats:
            PublicInterestStats.fromJson(json["public_interest_stats"]),
        statusUpdates: List<dynamic>.from(json["status_updates"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "platforms": platforms.toJson(),
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices":
            List<dynamic>.from(additionalNotices.map((x) => x)),
        "localization": localization.toJson(),
        "description": description.toJson(),
        "links": links.toJson(),
        "image": image.toJson(),
        "country_origin": countryOrigin,
        "genesis_date": genesisDate,
        "contract_address": contractAddress,
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_interest_score": publicInterestScore,
        "market_data": marketData.toJson(),
        "public_interest_stats": publicInterestStats.toJson(),
        "status_updates": List<dynamic>.from(statusUpdates.map((x) => x)),
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Tion {
  Tion({
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhTw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.id,
  });

  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhTw;
  final String ko;
  final String ar;
  final String th;
  final String id;

  factory Tion.fromRawJson(String str) => Tion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tion.fromJson(Map<String, dynamic> json) => Tion(
        en: json["en"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        it: json["it"],
        pl: json["pl"],
        ro: json["ro"],
        hu: json["hu"],
        nl: json["nl"],
        pt: json["pt"],
        sv: json["sv"],
        vi: json["vi"],
        tr: json["tr"],
        ru: json["ru"],
        ja: json["ja"],
        zh: json["zh"],
        zhTw: json["zh-tw"],
        ko: json["ko"],
        ar: json["ar"],
        th: json["th"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "de": de,
        "es": es,
        "fr": fr,
        "it": it,
        "pl": pl,
        "ro": ro,
        "hu": hu,
        "nl": nl,
        "pt": pt,
        "sv": sv,
        "vi": vi,
        "tr": tr,
        "ru": ru,
        "ja": ja,
        "zh": zh,
        "zh-tw": zhTw,
        "ko": ko,
        "ar": ar,
        "th": th,
        "id": id,
      };
}

class Image {
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });

  final String thumb;
  final String small;
  final String large;

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
      };
}

class Links {
  Links({
    required this.homepage,
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.twitterScreenName,
    required this.facebookUsername,
    required this.bitcointalkThreadIdentifier,
    required this.telegramChannelIdentifier,
    required this.subredditUrl,
    required this.reposUrl,
  });

  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String twitterScreenName;
  final String facebookUsername;
  final dynamic bitcointalkThreadIdentifier;
  final String telegramChannelIdentifier;
  final String? subredditUrl;
  final ReposUrl reposUrl;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json["homepage"].map((x) => x)),
        blockchainSite:
            List<String>.from(json["blockchain_site"].map((x) => x)),
        officialForumUrl:
            List<String>.from(json["official_forum_url"].map((x) => x)),
        chatUrl: List<String>.from(json["chat_url"].map((x) => x)),
        announcementUrl:
            List<String>.from(json["announcement_url"].map((x) => x)),
        twitterScreenName: json["twitter_screen_name"],
        facebookUsername: json["facebook_username"],
        bitcointalkThreadIdentifier: json["bitcointalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
        reposUrl: ReposUrl.fromJson(json["repos_url"]),
      );

  Map<String, dynamic> toJson() => {
        "homepage": List<dynamic>.from(homepage.map((x) => x)),
        "blockchain_site": List<dynamic>.from(blockchainSite.map((x) => x)),
        "official_forum_url":
            List<dynamic>.from(officialForumUrl.map((x) => x)),
        "chat_url": List<dynamic>.from(chatUrl.map((x) => x)),
        "announcement_url": List<dynamic>.from(announcementUrl.map((x) => x)),
        "twitter_screen_name": twitterScreenName,
        "facebook_username": facebookUsername,
        "bitcointalk_thread_identifier": bitcointalkThreadIdentifier,
        "telegram_channel_identifier": telegramChannelIdentifier,
        "subreddit_url": subredditUrl,
        "repos_url": reposUrl.toJson(),
      };
}

class ReposUrl {
  ReposUrl({
    required this.github,
    required this.bitbucket,
  });

  final List<dynamic> github;
  final List<dynamic> bitbucket;

  factory ReposUrl.fromRawJson(String str) =>
      ReposUrl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
        github: List<dynamic>.from(json["github"].map((x) => x)),
        bitbucket: List<dynamic>.from(json["bitbucket"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "github": List<dynamic>.from(github.map((x) => x)),
        "bitbucket": List<dynamic>.from(bitbucket.map((x) => x)),
      };
}

class MarketData {
  MarketData({
    required this.currentPrice,
    required this.totalValueLocked,
    required this.mcapToTvlRatio,
    required this.fdvToTvlRatio,
    required this.roi,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.priceChangePercentage7D,
    required this.priceChangePercentage14D,
    required this.priceChangePercentage30D,
    required this.priceChangePercentage60D,
    required this.priceChangePercentage200D,
    required this.priceChangePercentage1Y,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.priceChange24HInCurrency,
    required this.priceChangePercentage1HInCurrency,
    required this.priceChangePercentage24HInCurrency,
    required this.priceChangePercentage7DInCurrency,
    required this.priceChangePercentage14DInCurrency,
    required this.priceChangePercentage30DInCurrency,
    required this.priceChangePercentage60DInCurrency,
    required this.priceChangePercentage200DInCurrency,
    required this.priceChangePercentage1YInCurrency,
    required this.marketCapChange24HInCurrency,
    required this.marketCapChangePercentage24HInCurrency,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.lastUpdated,
  });

  final Map<String, double> currentPrice;
  final dynamic totalValueLocked;
  final dynamic mcapToTvlRatio;
  final dynamic fdvToTvlRatio;
  final dynamic roi;
  final Map<String, double> ath;
  final Map<String, double> athChangePercentage;
  final Map<String, DateTime> athDate;
  final Map<String, double> atl;
  final Map<String, double> atlChangePercentage;
  final Map<String, DateTime> atlDate;
  final Map<String, double> marketCap;
  final int marketCapRank;
  final FullyDilutedValuation fullyDilutedValuation;
  final Map<String, double> totalVolume;
  final Map<String, double> high24H;
  final Map<String, double> low24H;
  final double priceChange24H;
  final double priceChangePercentage24H;
  final double priceChangePercentage7D;
  final double priceChangePercentage14D;
  final double priceChangePercentage30D;
  final double priceChangePercentage60D;
  final double priceChangePercentage200D;
  final double priceChangePercentage1Y;
  final dynamic marketCapChange24H;
  final double marketCapChangePercentage24H;
  final Map<String, double> priceChange24HInCurrency;
  final Map<String, double> priceChangePercentage1HInCurrency;
  final Map<String, double> priceChangePercentage24HInCurrency;
  final Map<String, double> priceChangePercentage7DInCurrency;
  final Map<String, double> priceChangePercentage14DInCurrency;
  final Map<String, double> priceChangePercentage30DInCurrency;
  final Map<String, double> priceChangePercentage60DInCurrency;
  final Map<String, double> priceChangePercentage200DInCurrency;
  final Map<String, double> priceChangePercentage1YInCurrency;
  final Map<String, double> marketCapChange24HInCurrency;
  final Map<String, double> marketCapChangePercentage24HInCurrency;
  final double? totalSupply;
  final dynamic maxSupply;
  final double circulatingSupply;
  final DateTime lastUpdated;

  factory MarketData.fromRawJson(String str) =>
      MarketData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json["current_price"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Map.from(json["ath"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athChangePercentage: Map.from(json["ath_change_percentage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athDate: Map.from(json["ath_date"])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlChangePercentage: Map.from(json["atl_change_percentage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlDate: Map.from(json["atl_date"])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation:
            FullyDilutedValuation.fromJson(json["fully_diluted_valuation"]),
        totalVolume: Map.from(json["total_volume"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        high24H: Map.from(json["high_24h"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        low24H: Map.from(json["low_24h"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"].toDouble(),
        priceChangePercentage14D:
            json["price_change_percentage_14d"].toDouble(),
        priceChangePercentage30D:
            json["price_change_percentage_30d"].toDouble(),
        priceChangePercentage60D:
            json["price_change_percentage_60d"].toDouble(),
        priceChangePercentage200D:
            json["price_change_percentage_200d"].toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        priceChange24HInCurrency: Map.from(json["price_change_24h_in_currency"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1HInCurrency:
            Map.from(json["price_change_percentage_1h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage24HInCurrency:
            Map.from(json["price_change_percentage_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage7DInCurrency:
            Map.from(json["price_change_percentage_7d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage14DInCurrency:
            Map.from(json["price_change_percentage_14d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage30DInCurrency:
            Map.from(json["price_change_percentage_30d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage60DInCurrency:
            Map.from(json["price_change_percentage_60d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage200DInCurrency:
            Map.from(json["price_change_percentage_200d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1YInCurrency:
            Map.from(json["price_change_percentage_1y_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChange24HInCurrency:
            Map.from(json["market_cap_change_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChangePercentage24HInCurrency:
            Map.from(json["market_cap_change_percentage_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "current_price": Map.from(currentPrice)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_value_locked": totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio,
        "roi": roi,
        "ath": Map.from(ath).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_change_percentage": Map.from(athChangePercentage)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_date": Map.from(athDate)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "atl": Map.from(atl).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_change_percentage": Map.from(atlChangePercentage)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_date": Map.from(atlDate)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "market_cap":
            Map.from(marketCap).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation.toJson(),
        "total_volume": Map.from(totalVolume)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "high_24h":
            Map.from(high24H).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "low_24h":
            Map.from(low24H).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "price_change_percentage_7d": priceChangePercentage7D,
        "price_change_percentage_14d": priceChangePercentage14D,
        "price_change_percentage_30d": priceChangePercentage30D,
        "price_change_percentage_60d": priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D,
        "price_change_percentage_1y": priceChangePercentage1Y,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "price_change_24h_in_currency": Map.from(priceChange24HInCurrency)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency":
            Map.from(priceChangePercentage1HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency":
            Map.from(priceChangePercentage24HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency":
            Map.from(priceChangePercentage7DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency":
            Map.from(priceChangePercentage14DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency":
            Map.from(priceChangePercentage30DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency":
            Map.from(priceChangePercentage60DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency":
            Map.from(priceChangePercentage200DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency":
            Map.from(priceChangePercentage1YInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency":
            Map.from(marketCapChange24HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency":
            Map.from(marketCapChangePercentage24HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class FullyDilutedValuation {
  FullyDilutedValuation();

  factory FullyDilutedValuation.fromRawJson(String str) =>
      FullyDilutedValuation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FullyDilutedValuation.fromJson(Map<String, dynamic> json) =>
      FullyDilutedValuation();

  Map<String, dynamic> toJson() => {};
}

class Platforms {
  Platforms({
    required this.ethereum,
  });

  final String? ethereum;

  factory Platforms.fromRawJson(String str) =>
      Platforms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
        ethereum: json["ethereum"],
      );

  Map<String, dynamic> toJson() => {
        "ethereum": ethereum,
      };
}

class PublicInterestStats {
  PublicInterestStats({
    required this.alexaRank,
    required this.bingMatches,
  });

  final int alexaRank;
  final dynamic bingMatches;

  factory PublicInterestStats.fromRawJson(String str) =>
      PublicInterestStats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PublicInterestStats.fromJson(Map<String, dynamic> json) =>
      PublicInterestStats(
        alexaRank: json["alexa_rank"],
        bingMatches: json["bing_matches"],
      );

  Map<String, dynamic> toJson() => {
        "alexa_rank": alexaRank,
        "bing_matches": bingMatches,
      };
}
