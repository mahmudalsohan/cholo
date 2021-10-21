import 'package:cholo/constants/controller.dart';
import 'package:cholo/constants/text_style.dart';
import 'package:cholo/screens/authentication/widgets/auth_button.dart';
import 'package:cholo/screens/authentication/widgets/auth_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final RxBool _isRegisterPage = true.obs;
  final RxBool _isObsText = true.obs;
  /*final Rx<void> _errText = ;*/
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              _isRegisterPage.value ? "Register" : "Login",
              style: kTitleTextStyle,
            ),
            //
            const SizedBox(height: 20),
            //
            //Username
            Visibility(
              visible: _isRegisterPage.value,
              child: AuthTextField(
                label: "Name",
                controller: _nameController,
                keyboardType: TextInputType.name,
              ),
            ),
            //
            //Phone
            Visibility(
              visible: _isRegisterPage.value,
              child: AuthTextField(
                label: "Phone",
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
            ),
            //
            //Email
            AuthTextField(
              label: "E-mail",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              /*errText: _errText,*/
            ),
            //
            //Password
            AuthTextField(
              label: "Password",
              controller: _passwordController,
              obsText: _isObsText.value,
              suffixIcon: _passwordIcon(),
            ),
            //
            const SizedBox(height: 20),
            //
            //Button
            _isRegisterPage.value
                ? AuthButton(
                    onTap: () {
                      _validateEmail(_emailController.text)
                          ? authController.emailRegistration(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              phone: _phoneController.text,
                            )
                          : _showErrorText();
                      //_clearTextFields();
                    },
                    text: "Create Account",
                  )
                : AuthButton(
                    onTap: () {
                      authController.emailSignIn(
                        _emailController.text,
                        _passwordController.text,
                      );
                      //_clearTextFields();
                    },
                    text: "Login",
                  ),
            //
            const SizedBox(height: 10),
            //
            //Linked Text
            RichText(
              text: TextSpan(
                text: _isRegisterPage.value
                    ? "Already have an Account? "
                    : "Don't have an Account? ",
                style: kPlainTextStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: _isRegisterPage.value ? " Login ." : " Register .",
                    style: kLinkTextStyle,
                    recognizer: TapGestureRecognizer()..onTap = _handleTap,
                  ),
                ],
              ),
            ),
            //
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }

  _showErrorText() {
    /*_errText = "Input Valid Email";*/
  }

  bool _validateEmail(String email) {
    return GetUtils.isEmail(email);
  }

  Widget _passwordIcon() {
    return _isObsText.value
        ? InkWell(
            onTap: () {
              _isObsText.value = !_isObsText.value;
            },
            child: const Icon(
              Icons.visibility_off,
              color: Colors.grey,
            ),
          )
        : InkWell(
            onTap: () {
              _isObsText.value = !_isObsText.value;
            },
            child: const Icon(
              Icons.visibility,
              color: Colors.blue,
            ),
          );
  }

  _handleTap() {
    _isRegisterPage.value = !_isRegisterPage.value;
    _clearTextFields();
  }

  _clearTextFields() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
  }
}
