import 'dart:async';

import '../widgets/axie_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controllers/account_home_controller.dart';
import '../widgets/coin_tracker.dart';

class AccountHomeView extends GetView<AccountHomeController> {
  final String? _id = Get.parameters['id'];

  @override
  Widget build(BuildContext context) {
    final account = controller.account;
    double _panelMinHeight = MediaQuery.of(context).size.height * 0.1;
    double _panelMaxHeight = MediaQuery.of(context).size.height * 0.8;

    String _timeAgos(int timeStamp) {
      var time = '';
      var date = DateTime.fromMillisecondsSinceEpoch(
        timeStamp * 1000,
      );
      time = timeago.format(date);
      return time;
    }

    Future<double?> _convertUsd(int totalSlp) async {
      double? usd = 0.0;
      final doubleSlp = totalSlp.toDouble();
      final coin = await controller.getCoinData('smooth-love-potion');
      final currentUsd = coin.marketData.currentPrice['usd']!.toDouble();
      usd = doubleSlp * currentUsd;
      return usd;
    }

    Future<void> _handleRefresh() async {
      final Completer<void> completer = Completer<void>();
      Timer(const Duration(milliseconds: 1000), () {
        completer.complete();
      });
      await controller.getAccountInfo(_id!);
      return completer.future.then<void>((_) {
        Get.snackbar(
          'Alert',
          'Refresh complete',
          icon: Icon(FontAwesomeIcons.checkCircle),
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    }

    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(controller.name)),
            actions: [
              IconButton(
                onPressed: () => _handleRefresh(),
                icon: Icon(Icons.refresh),
              )
            ],
          ),
          body: SlidingUpPanel(
            minHeight: _panelMinHeight,
            maxHeight: _panelMaxHeight,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            color: Colors.blue.shade800,
            panelBuilder: (scroll) => AxiePanel(
              controller: scroll,
              axieList: controller.listAxie,
              total: controller.totalAxie,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CoinTracker('smooth-love-potion', 4),
                        CoinTracker('axie-infinity'),
                        CoinTracker('ethereum'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Total SLP'),
                            Text('${account.totalSlp.toString()} SLP'),
                            FutureBuilder(
                              future: _convertUsd(account.totalSlp),
                              builder: (BuildContext context,
                                  AsyncSnapshot<double?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    return Text(
                                        '${snapshot.data!.toStringAsFixed(2)} USD');
                                  }
                                }
                                return Text('0 USD');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Claimed SLP'),
                            Text('${account.lifetimeSlp.toString()} SLP'),
                            FutureBuilder(
                              future: _convertUsd(account.lifetimeSlp),
                              builder: (BuildContext context,
                                  AsyncSnapshot<double?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    return Text(
                                        '${snapshot.data!.toStringAsFixed(2)} USD');
                                  }
                                }
                                return Text('0 USD');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Rank'),
                            Text('Current rank: ${account.rank.toString()}'),
                            Text('Elo: ${account.mmr.toString()}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
