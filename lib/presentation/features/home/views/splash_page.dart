import '/presentation/features/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({Key? key}) : super(key: key);

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5))
        .then((value) => Get.offAll(() => const HomePage()));
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
