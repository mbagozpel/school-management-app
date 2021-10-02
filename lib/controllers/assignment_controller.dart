import 'package:get/get.dart';

class AssignmentController extends GetxController {
  bool _isContinue = false;

  bool get startCreation => _isContinue;
  void isContinue() {
    _isContinue = true;
    update();
  }
}
