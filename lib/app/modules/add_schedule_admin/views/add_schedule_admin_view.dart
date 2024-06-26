import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_schedule_admin_controller.dart';

class AddScheduleAdminView extends GetView<AddScheduleAdminController> {
  const AddScheduleAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddScheduleAdminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddScheduleAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
