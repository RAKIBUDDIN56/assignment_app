import '/presentation/features/home/controller/api/api_client.dart';
import '/presentation/features/home/controller/models/mail_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String domain = '';
  String token = '';
  var mailList = <EmailDetails>[];
  var isLoadingDomain = false.obs;
  var isLoadingCreateAccount = false.obs;
  var isLoadingMails = false.obs;
  var isLoadingLogin = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDomainName();
  }

  getDomainName() async {
    isLoadingDomain(true);
    var response = await ApiClient.getDomain();
    if (response != null) {
      domain = response;
    }
    isLoadingDomain(false);
    print(domain);
  }

  Future<String?> createAccount(Map data) async {
    isLoadingCreateAccount(true);
    var response = await ApiClient.createAccount(data);
    isLoadingCreateAccount(false);
    return response;
  }

  Future<String?> login(Map data) async {
    isLoadingLogin(true);
    var response = await ApiClient.login(data);
    if (response != null) {
      token = response;
    }

    isLoadingLogin(false);
    return response;
  }

  getAllMails() async {
    isLoadingMails(true);
    var response = await ApiClient.getMails(token);
    if (response != null) {
      mailList = response;
    }
    isLoadingMails(false);
  }
}
