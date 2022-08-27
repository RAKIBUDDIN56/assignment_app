import 'package:demo_app/modules/splashScreen/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = Get.find<SplashPageController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        splashController.isLogged
            ? Get.offNamed('/home')
            : Get.offAllNamed('/signin'));
  }

  double height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TweenAnimationBuilder(
            onEnd: () {
              setState(() {
                height = height == 200 ? 200 : 200;
              });
            },
            curve: Curves.bounceOut,
            tween: Tween<double>(begin: 200, end: 400),
            duration: const Duration(seconds: 5),
            builder: (context, dynamic value, child) {
              return Center(
                  child: Image.asset(
                'assets/images/logo.jpg',
                height: value,
              ));
            }));
  }
}
