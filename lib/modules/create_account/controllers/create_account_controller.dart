import 'package:demo_app/core_services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var hidePassword = true.obs;
  var isLoading = false.obs;
  String domainName = '';

  @override
  void onInit() {
    super.onInit();
    getDomainList();
  }

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  getDomainList() async {
    List<String> lists = [];
    try {
      isLoading.value = true;
      update();
      await ApiClient.getDomains().then((value) {
        value!.hydraMember.asMap().forEach((key, value) {
          if (value.isActive == true) {
            lists.add(value.domain);
          }
        });
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      domainName = lists[0];
      update();
    }
  }

  signUp(String email, String password) async {
    try {
      isLoading.value = true;
      update();
      await ApiClient.createAccount(email, password).then((value) {
        if (value != null) {
          Fluttertoast.showToast(
            msg: "Account has been created successfully.",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
          Get.offAndToNamed('/signin');
        } else {
          Fluttertoast.showToast(
            msg: "Something is wrong",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
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
