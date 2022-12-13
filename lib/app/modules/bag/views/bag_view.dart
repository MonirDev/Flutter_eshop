import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bag_controller.dart';

class BagView extends GetView<BagController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BagView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BagView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
