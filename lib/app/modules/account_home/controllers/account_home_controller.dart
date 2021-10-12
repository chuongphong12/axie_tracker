import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/account.dart';
import '../../../models/axies.dart';
import '../../../models/coin.dart';

class AccountHomeController extends GetxController {
  final _account = Account(
          cacheLastUpdated: 0,
          drawTotal: 0,
          inGameSlp: 0,
          lastClaim: 0,
          lifetimeSlp: 0,
          loseTotal: 0,
          mmr: 0,
          name: '',
          nextClaim: 0,
          rank: 0,
          roninSlp: 0,
          totalMatches: 0,
          totalSlp: 0,
          winRate: 0,
          winTotal: 0)
      .obs;
  final _name = ''.obs;
  final _totalAxie = 0.obs;
  final _listAxie = <Result>[].obs;

  String get name => _name.value;
  int get totalAxie => _totalAxie.value;
  List<Result> get listAxie => _listAxie;
  Account get account => _account.value;
  bool _running = true;

  final gameApi = 'https://game-api.axie.technology/api/v1/';
  // final axieWorld = 'https://axiesworld.firebaseapp.com/updateSpecific';
  final coinGecko = 'https://api.coingecko.com/api/v3/coins/';
  final axies = 'https://api.lunaciaproxy.cloud/_axies/';

  Future<void> getAccountInfo(String address) async {
    final url = '$gameApi$address';
    // final url = '$axieWorld?wallet=$address';

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = Account.fromRawJson(res.body);
        _account(data);
        _name(data.name);
        await getAxiesData(address);
      }
    } on HttpException catch (e) {
      print(e.message);
    } catch (err) {
      print(err);
    }
  }

  Future<Coin> getCoinData(String coinId) async {
    final url =
        '$coinGecko$coinId?tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false';

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = Coin.fromRawJson(res.body);
        return data;
      } else {
        throw "Can't get coin data";
      }
    } on HttpException catch (e) {
      print(e.message);
      throw (e.message);
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Stream<Coin> streamGetCoinData(String coinString) async* {
    while (_running) {
      await Future<void>.delayed(Duration(seconds: 10));
      Coin coinData = await getCoinData(coinString);
      yield coinData;
    }
  }

  Future<void> getAxiesData(String address) async {
    final url = '$axies$address';

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = Axies.fromRawJson(res.body);
        _listAxie(data.availableAxies.results);
        _totalAxie(data.availableAxies.total);
      } else {
        throw "Can't get axies data";
      }
    } on HttpException catch (e) {
      print(e.message);
      throw (e.message);
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  @override
  void onClose() {}
}
