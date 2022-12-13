import 'package:eshop/app/modules/bottom_bar/widgets/tab_item.dart';
import 'package:eshop/app/modules/shop/views/shop_view.dart';
import 'package:eshop/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomBarController extends GetxController {
  Rx<TabItem> currentTab = TabItem.home.obs;
  final navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.shop: GlobalKey<NavigatorState>(),
    TabItem.bag: GlobalKey<NavigatorState>(),
    TabItem.favorite: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };
  void selectTab(TabItem tabItem) {
    if (tabItem == currentTab.value) {
      // pop to first route
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      currentTab.value = tabItem;
    }
  }

//Build Routes for all screen
  Map<String, WidgetBuilder> routeBuilders(
      BuildContext context, TabItem tabItem) {
    return {
      '/': (context) => widget[tabItem]!,
      Routes.shop: (context) => ShopView(),
    };
  }

  void toNamed(BuildContext context, routeName, {Object? arguments}) {
    var routeBuilder = routeBuilders(context, currentTab.value);

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            routeBuilder[routeName]!(context),
        settings: RouteSettings(arguments: arguments),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return transationBuilder(
              context, animation, secondaryAnimation, child);
        },
      ),
      // MaterialPageRoute(
      //   builder: (context) => routeBuilder[routeName]!(context),
      //   settings: RouteSettings(arguments: arguments),
      // ),
    );
  }

  void offNamed(BuildContext context, routeName, {Object? arguments}) {
    var routeBuilder = routeBuilders(context, currentTab.value);

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            routeBuilder[routeName]!(context),
        settings: RouteSettings(arguments: arguments),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return transationBuilder(
              context, animation, secondaryAnimation, child);
        },
      ),
    );
  }

//Build Transation animation
  transationBuilder(BuildContext context, Animation<double> animation,
      Animation<double> sAnimation, Widget child) {
    const begin = Offset(0.7, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
