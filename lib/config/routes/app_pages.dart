import 'package:demo_app/bindings/initial_binding.dart';
import 'package:demo_app/modules/home/views/home_page.dart';
import 'package:get/get.dart';
import '/modules/home/bindings/home_binding.dart';
import '/modules/signin/bindings/signin_binding.dart';
import '../../modules/signin/views/signin_page.dart';
import '../../modules/create_account/bindings/create_account_binding.dart';
import '../../modules/create_account/views/create_account_page.dart';
import '/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.createAccount,
      page: () => CreateAccountPage(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
  ];
}
