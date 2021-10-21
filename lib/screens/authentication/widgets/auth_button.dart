import 'package:cholo/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AuthButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const AuthButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: Get.width - 2 * 20,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
