import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bus_schedule_user_controller.dart';

class BusScheduleUserView extends GetView<BusScheduleUserController> {
  const BusScheduleUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusScheduleUserView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BusScheduleUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
