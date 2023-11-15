import 'package:get/get.dart';

import '../../../../presentation/auth/signup/controllers/auth_signup.controller.dart';

class AuthSignupControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthSignupController>(
      () => AuthSignupController(),
    );
  }
}
