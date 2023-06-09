import 'package:get/get.dart';

class HomeNavController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int newIndex) {
    _selectedIndex = newIndex;
    update();
  }

  void backToHome() {
    _selectedIndex = 0;
    update();
  }
}