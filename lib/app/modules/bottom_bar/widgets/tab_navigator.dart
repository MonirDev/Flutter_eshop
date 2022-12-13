import 'package:eshop/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:eshop/app/modules/bottom_bar/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    final routeBuilders = BottomBarController().routeBuilders(context, tabItem);
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
