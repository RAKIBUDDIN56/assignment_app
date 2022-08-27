import 'package:demo_app/config/routes/app_pages.dart';

import '/presentation/features/home/binding/bindings.dart';
import '/presentation/features/home/views/splash_page.dart';
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
      initialBinding: InitialBindings(),
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
