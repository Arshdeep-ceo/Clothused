import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  final String backgroundImage =
      'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhc2hpb258ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500';

  void navigateToHome() => Get.offNamed('/nav');

  void navigateToLoginScreen() => Get.offNamed('login_view');

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
