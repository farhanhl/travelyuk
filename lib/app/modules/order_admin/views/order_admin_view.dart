import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_admin_controller.dart';

class OrderAdminView extends GetView<OrderAdminController> {
  const OrderAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderAdminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
