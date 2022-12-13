import 'package:eshop/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:eshop/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:eshop/app/modules/shop/bindings/shop_binding.dart';
import 'package:eshop/app/modules/shop/views/shop_view.dart';
import 'package:eshop/app/routes/app_pages.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: GestureDetector(
          onTap: () => BottomBarController().toNamed(context, Routes.shop),
          child: Text(
            'HomeView is working',
            style: AppTextStyle.nb20,
          ),
        ),
      ),
    );
  }
}
