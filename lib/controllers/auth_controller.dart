import 'package:cholo/screens/authentication/auth_screen.dart';
import 'package:cholo/screens/home/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  RxBool isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();

    _setInitialScreen();
  }

  _setInitialScreen() {
    isLoggedIn.value
        ? Get.offAll(const HomeScreen())
        : Get.offAll(AuthScreen());
  }
}
