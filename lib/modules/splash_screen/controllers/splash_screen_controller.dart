import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashPageController extends GetxController {
  final localStorage = GetStorage();
  bool isLogged = false;

  @override
  void onInit() async {
    super.onInit();
    if (localStorage.read('token') == null) {
      isLogged = false;
    } else {
      isLogged = true;
    }
  }
}
