import '/presentation/features/home/controller/home_controller.dart';
import '/presentation/features/home/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  final homeController = Get.find<HomeController>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: homeController.isLoadingDomain.value
              ? const CircularProgressIndicator()
              : Container(
                  padding: const EdgeInsets.all(10),
                  height: 400,
                  child: Column(children: [
                    const Text(
                      'Create an account',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: 'Username',
                          fillColor: Colors.white70),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Password",
                          fillColor: Colors.white70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    homeController.isLoadingCreateAccount.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _createBtnHandler,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan, shape: StadiumBorder()),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(fontSize: 20),
                            ))
                  ]),
                ),
        );
      }),
    );
  }

  _createBtnHandler() async {
    var res = await homeController.createAccount({
      'address': _emailController.text + '@' + homeController.domain,
      'password': 'fghhhhh'
    });
    if (res != null) {
      Get.to(() => LoginPage(
            email: _emailController.text + '@' + homeController.domain,
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username is not valid'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
