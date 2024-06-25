import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_user_controller.dart';

class LoginUserView extends GetView<LoginUserController> {
  const LoginUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginUserView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
