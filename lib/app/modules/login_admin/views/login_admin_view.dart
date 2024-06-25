import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_admin_controller.dart';

class LoginAdminView extends GetView<LoginAdminController> {
  const LoginAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginAdminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
