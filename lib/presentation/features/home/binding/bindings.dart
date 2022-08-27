import 'package:demo_app/bindings/initial_binding.dart';
import 'package:demo_app/modules/splashScreen/controllers/splash_screen_controller.dart';
import 'package:demo_app/presentation/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
  }
}
