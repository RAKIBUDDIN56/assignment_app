import 'package:demo_app/core_services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final localStorage = GetStorage();
  var isLoading = false.obs;
  var hidePassword = true.obs;

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  signIn(String email, String password) async {
    try {
      isLoading.value = true;
      update();
      await ApiClient.signIn(email, password).then((value) {
        if (value != null) {
          localStorage.write('token', value.token);
          Get.offAllNamed('/home');
        } else {
          Fluttertoast.showToast(
            msg: "Something is wrong",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
