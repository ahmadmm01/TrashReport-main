import 'package:get/get.dart';

import '../../../../presentation/trash/controllers/trash.controller.dart';

class TrashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrashController>(
      () => TrashController(),
    );
  }
}
