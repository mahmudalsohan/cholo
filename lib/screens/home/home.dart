import 'package:cholo/constants/firebase.dart';
import 'package:cholo/screens/authentication/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            auth.signOut().then((value) => Get.offAll(() => AuthScreen()));
          },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
