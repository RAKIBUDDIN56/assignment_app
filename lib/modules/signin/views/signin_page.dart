import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninPage extends GetView<SigninController> {
  final _formKey = GlobalKey<FormState>();

  SigninPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Signin',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email Addresss',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Email is required";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: controller.passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: controller.hidePassword.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: const OutlineInputBorder(),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: IconButton(
                                      icon: Icon(
                                        controller.hidePassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        controller.passwordHide();
                                      }),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Password is required";
                                } else {
                                  return null;
                                }
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: _signinBtnHandler,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: const StadiumBorder(),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      child: const Text("Signin"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed('/createAccount');
                                  },
                                text: "Create account",
                                style: const TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 16,
                                ))
                          ]),
                    )
                  ],
                ),
              )));
  }

  _signinBtnHandler() {
    if (_formKey.currentState!.validate()) {
      final email = controller.emailController.text;
      final password = controller.passwordController.text;
      controller.signIn(email, password);
    }
  }
}
