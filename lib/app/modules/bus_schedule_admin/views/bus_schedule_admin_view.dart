import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bus_schedule_admin_controller.dart';

class BusScheduleAdminView extends GetView<BusScheduleAdminController> {
  const BusScheduleAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusScheduleAdminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BusScheduleAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
