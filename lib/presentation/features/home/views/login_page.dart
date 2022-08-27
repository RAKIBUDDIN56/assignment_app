import '/presentation/features/home/controller/home_controller.dart';
import '/presentation/features/home/views/mail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  final String email;

  const LoginPage({Key? key, required this.email}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  final homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: homeController.isLoadingLogin.value
              ? const CircularProgressIndicator()
              : Container(
                  padding: const EdgeInsets.all(10),
                  height: 400,
                  child: Column(children: [
                    const Text(
                      'Login',
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
                            onPressed: _loginBtnHandler,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                                shape: const StadiumBorder()),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 22),
                            ))
                  ]),
                ),
        );
      }),
    );
  }

  _loginBtnHandler() async {
    var res = await homeController
        .login({'address': widget.email, 'password': 'fghhhhh'});
    if (res != null) {
      Get.to(() => MailPage(
            email: widget.email,
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Authentication failed'),
        backgroundColor: Colors.red,
      ));
    }
  }
}
