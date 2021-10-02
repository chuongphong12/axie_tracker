import '../../../models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../widgets/app_drawer.dart';
import 'home_view.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final ZoomDrawerController _zoomController = ZoomDrawerController();
  MenuItem currentItem = MenuItems.account;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        controller: _zoomController,
        style: DrawerStyle.Style1,
        menuScreen: Builder(builder: (context) {
          return AppDrawer(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              });
        }),
        mainScreen: getScreen(),
        borderRadius: 40.0,
        showShadow: true,
        backgroundColor: Colors.amberAccent,
        angle: -12.0,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.fastLinearToSlowEaseIn,
      );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.account:
        return HomeView();
      default:
        return HomeView();
    }
  }
}
