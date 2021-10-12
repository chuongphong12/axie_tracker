import '../modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu_item.dart';

class MenuItems {
  static const account = MenuItem('Account', Icons.verified_user);
  static const report = MenuItem('Report', Icons.stacked_bar_chart);
  static const coin = MenuItem('Coin', Icons.money);
  static const aboutUs = MenuItem('About Us', Icons.info_outline);
  static const rateUs = MenuItem('Rate Us', Icons.star_border);

  static const all = <MenuItem>[account, report, coin, aboutUs, rateUs];
}

class AppDrawer extends StatelessWidget {
  final _controller = Get.find<AuthController>();
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  AppDrawer({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                ...MenuItems.all.map(buildMenuItem).toList(),
                Spacer(flex: 2),
                ListTile(
                  selectedTileColor: Colors.black26,
                  minLeadingWidth: 25,
                  leading: Icon(Icons.exit_to_app_rounded),
                  title: Text('Logout'),
                  onTap: () {
                    _controller.signOut();
                  },
                )
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: currentItem == item,
          minLeadingWidth: 25,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}
