import 'package:get/get.dart';

class StartupViewModel extends GetxController {
  final String _title = 'Startup';
  String get title => _title;

  Future navigateToHome() async {
    Get.toNamed('/nav');
  }
}
