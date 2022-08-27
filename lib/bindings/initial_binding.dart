import 'package:demo_app/modules/splashScreen/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      () => SplashPageController(),
    );
  }
}
