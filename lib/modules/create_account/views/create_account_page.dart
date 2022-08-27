import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  final _formKey = GlobalKey<FormState>();

  CreateAccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create an account',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: controller.domainName,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Type Username',
                                  border: const OutlineInputBorder(),
                                  suffix: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SizedBox(
                                      width: Get.width / 3,
                                      child: Text(
                                        "@${controller.domainName}",
                                      ),
                                    ),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Usrname is required";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.hidePassword.value,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: ' Type Password',
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
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
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
                      onPressed: _createAccountBtnHandler,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          shape: const StadiumBorder(),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      child: const Text("Create Account"),
                    )
                  ],
                ),
              )));
  }

  _createAccountBtnHandler() {
    if (_formKey.currentState!.validate()) {
      final email =
          controller.emailController.text + "@" + controller.domainName;
      final password = controller.passwordController.text;

      controller.signUp(email, password);
    }
  }
}
