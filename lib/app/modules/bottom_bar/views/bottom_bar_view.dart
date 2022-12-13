import 'package:eshop/app/modules/bottom_bar/widgets/bottom_navigation.dart';
import 'package:eshop/app/modules/bottom_bar/widgets/tab_item.dart';
import 'package:eshop/app/modules/bottom_bar/widgets/tab_navigator.dart';
import 'package:eshop/app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await controller
            .navigatorKeys[controller.currentTab.value]!.currentState!
            .maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (controller.currentTab.value != TabItem.home) {
            // select 'main' tab
            controller.selectTab(TabItem.home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Obx(() => Scaffold(
            backgroundColor: AppColors.white,
            body: Stack(children: <Widget>[
              _buildOffstageNavigator(TabItem.home),
              _buildOffstageNavigator(TabItem.shop),
              _buildOffstageNavigator(TabItem.bag),
              _buildOffstageNavigator(TabItem.favorite),
              _buildOffstageNavigator(TabItem.profile),
            ]),
            bottomNavigationBar: BottomNavigation(
              currentTab: controller.currentTab.value,
              onSelectTab: controller.selectTab,
            ),
          )),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: controller.currentTab.value != tabItem,
      child: TabNavigator(
        navigatorKey: controller.navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
