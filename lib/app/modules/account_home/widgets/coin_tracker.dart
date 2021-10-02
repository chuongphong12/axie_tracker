import '../../../models/coin.dart' as coin;
import '../controllers/account_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinTracker extends StatelessWidget {
  final _controller = Get.find<AccountHomeController>();

  final String coinId;
  final int stringAsFixed;

  CoinTracker(this.coinId, [this.stringAsFixed = 2]);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.fromFuture(_controller.getCoinData(coinId)),
      builder: (context, AsyncSnapshot<coin.Coin> snapshot) {
        if (snapshot.hasData) {
          final currentPrice = snapshot.data!.marketData.currentPrice['usd']!
              .toStringAsFixed(stringAsFixed);

          final priceChangePercentIn24H = snapshot
              .data!.marketData.priceChangePercentage24HInCurrency['usd']!
              .toStringAsFixed(2);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                snapshot.data!.image.small,
                width: 30,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 2,
              ),
              Text(currentPrice),
              SizedBox(
                width: 2,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: priceChangePercentIn24H.substring(0, 1) == '-'
                      ? Color(0xFFFC3B3B)
                      : Color(0xFF44FC3B),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  priceChangePercentIn24H,
                ),
              )
            ],
          );
        }
        return Center(
          child: Text(coinId.toString()),
        );
      },
    );
  }
}
