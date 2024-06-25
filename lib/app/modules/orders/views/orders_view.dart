import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (controller) {
        return Scaffold(
          body: const Center(
            child: Text(
              'OrdersView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
