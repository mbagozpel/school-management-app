import 'package:get/get.dart';

class CustomPageController extends GetxController {
  int selectedIndex = 0;

  void selected(index) {
    selectedIndex = index;
    update();
  }
}
