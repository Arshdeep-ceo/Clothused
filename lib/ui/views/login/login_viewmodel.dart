import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final String backgroundImage =
      'https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=495&q=80';
  void navigateToHome() => Get.offAllNamed('/nav');
  void navigateToSignupScreen() => Get.offNamed('signup_view');

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      navigateToHome();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong Password');
        // print('Wrong password provided for that user.');
      }
    }
  }
}
