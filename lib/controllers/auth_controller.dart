import 'package:cholo/constants/firebase.dart';
import 'package:cholo/screens/authentication/auth_screen.dart';
import 'package:cholo/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        ? Get.offAll(() => const HomeScreen())
        : Get.offAll(() => AuthScreen());
  }

  // _uploadUserDetails(String name, String email, String phone, String password) {
  //   users.doc(auth.currentUser!.uid).set({
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'pass': password,
  //   });
  // }

  emailRegistration({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => users.doc(auth.currentUser!.uid).set({
              'name': name,
              'email': email,
              'phone': phone,
              'pass': password,
            }).then(
              (value) => Get.offAll(() => const HomeScreen()),
            ),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Weak Password",
          "Use strong password instead.",
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Account already exists",
          "Log In instead.",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  emailSignIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => Get.offAll(
              () => const HomeScreen(),
            ),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
