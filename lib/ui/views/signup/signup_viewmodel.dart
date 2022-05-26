import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stacked_architecture/ui/views/login/login_view.dart';

class SignupViewModel extends GetxController {
  // SignupViewModel({required this.email, required this.password});

  void navigateToHome() => Get.offNamed('/');

  void navigateToLoginScreen() => Get.toNamed('login_view');

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> createNewUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigateToHome();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
        );
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
        );
        // print('The account already exists for that email.');
      }
    } catch (e) {
      // print(e);
    }
  }
}
