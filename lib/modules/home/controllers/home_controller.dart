import 'package:demo_app/core_services/api_client.dart';
import 'package:demo_app/modules/home/model/mail_list_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final localStorage = GetStorage();
  var mailList = <MailDetails>[].obs;
  var token = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = localStorage.read('token');
    update();
    await getMails();
  }

  getMails() async {
    try {
      isLoading.value = true;
      update();
      await ApiClient.getMails(token.value).then((value) {
        if (value!.isNotEmpty) {
          mailList.value = value;
        } else {
          Fluttertoast.showToast(
            msg: "No Mails",
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

  logOut() {
    localStorage.remove('token');
    Get.offAllNamed('signin');
  }
}
