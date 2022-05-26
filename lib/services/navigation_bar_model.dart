import 'package:get/get.dart';

class NavigationBarModel extends GetxController {
  final _index = 0.obs;
  int get selectedIndex => _index.value;

  void changeIndex(int tappedIndex) {
    _index.value = tappedIndex;
  }
}
