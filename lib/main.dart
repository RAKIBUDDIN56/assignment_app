import 'package:demo_app/bindings/initial_binding.dart';
import 'package:demo_app/config/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
