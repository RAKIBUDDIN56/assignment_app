import 'package:demo_app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      () => SplashPageController(),
    );
  }
}
