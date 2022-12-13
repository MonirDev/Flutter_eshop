import 'package:eshop/app/modules/bag/views/bag_view.dart';
import 'package:eshop/app/modules/home/views/home_view.dart';
import 'package:eshop/app/modules/shop/views/shop_view.dart';
import 'package:flutter/material.dart';

enum TabItem { home, shop, bag, favorite, profile }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.shop: 'Shop',
  TabItem.bag: 'Bag',
  TabItem.favorite: 'Favorite',
  TabItem.profile: 'Profile',
};

Map<TabItem, Widget> widget = {
  TabItem.home: HomeView(),
  TabItem.shop: ShopView(),
  TabItem.bag: BagView(),
  TabItem.favorite: ShopView(),
  TabItem.profile: BagView(),
};
