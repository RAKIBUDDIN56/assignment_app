import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashPageController>(
      () => SplashPageController(),
    );
  }
}
