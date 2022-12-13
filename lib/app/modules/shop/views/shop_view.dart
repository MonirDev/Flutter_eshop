import 'package:eshop/app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ShopView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
