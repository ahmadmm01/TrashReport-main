import 'package:get/get.dart';

import '../../../../presentation/display/controllers/display.controller.dart';

class DisplayControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisplayController>(
      () => DisplayController(),
    );
  }
}
