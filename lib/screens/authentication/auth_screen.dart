import 'package:cholo/constants/text_style.dart';
import 'package:cholo/screens/authentication/widgets/reusable_button.dart';
import 'package:cholo/screens/authentication/widgets/reusable_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final RxBool isRegisterPage = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            //
            //Title
            Text(
              isRegisterPage.value ? "Register" : "Login",
              style: titleTextStyle,
            ),
            //
            const SizedBox(height: 20),
            //
            //Name
            Visibility(
              visible: isRegisterPage.value,
              child: const ReusableTextField(
                label: "Name",
              ),
            ),
            //
            //Email
            const Visibility(
              visible: true,
              child: ReusableTextField(
                label: "E-mail",
              ),
            ),
            //
            //Password
            const Visibility(
              visible: true,
              child: ReusableTextField(
                label: "Password",
              ),
            ),
            //
            const SizedBox(height: 20),
            //
            //Button
            isRegisterPage.value
                ? ReusableButton(onTap: () {}, text: "Register")
                : ReusableButton(onTap: () {}, text: "Login"),
            //
            const SizedBox(height: 10),
            //
            //Linked Text
            RichText(
              text: TextSpan(
                text: isRegisterPage.value
                    ? "Already have an Account? "
                    : "Don't have an Account? ",
                style: plainTextStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: isRegisterPage.value ? " Login ." : " Register .",
                    style: linkTextStyle,
                    recognizer: TapGestureRecognizer()..onTap = _handleTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _handleTap() {
    isRegisterPage.value = !isRegisterPage.value;
  }
}
