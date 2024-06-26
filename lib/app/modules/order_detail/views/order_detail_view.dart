import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelyuk/app/widgets/custom_widgets.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      init: OrderDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomWidget.appBar(isLeading: true),
          body: const Center(
            child: Text(
              'OrderDetailView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
