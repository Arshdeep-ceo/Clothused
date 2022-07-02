import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final String _title = 'Home Sweet Home';
  String get title => _title;

  final _counter = 0.obs;
  int get counter => _counter.value;

  int increment() => _counter.value++;

  void backToHome() => Get.back();

  void navigateToSignup() => Get.offAllNamed('/signup_view');

  void navigateToProductScreen() => Get.toNamed('/product_details_view');

  final String _productImage =
      'https://images.unsplash.com/photo-1496440737103-cd596325d314?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500';
  String get productImage => _productImage;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    navigateToSignup();
  }
}
