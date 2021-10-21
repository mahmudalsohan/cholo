import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final String? errText;
  final TextEditingController controller;
  final bool obsText;
  final Widget? suffixIcon;
  //
  const AuthTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.errText,
    this.keyboardType,
    this.suffixIcon,
    this.obsText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obsText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorText: errText,
          labelText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
