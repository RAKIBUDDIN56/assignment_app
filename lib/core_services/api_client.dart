import 'package:demo_app/API/api_end_points.dart';
import 'package:demo_app/API/base_url.dart';
import 'package:demo_app/modules/create_account/model/domain_list_model.dart';
import 'package:demo_app/modules/create_account/model/create_account_model.dart';
import 'package:demo_app/modules/home/model/mail_list_model.dart';
import 'package:demo_app/modules/signin/model/signin_model.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static Dio dio = Dio();

  static Future<DomainListModel?> getDomains() async {
    final response = await dio.get(BaseURL.baseURL + ApiEndPoints.domains,
        options: Options(headers: {"Content-Type": "application/json"}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return DomainListModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  static Future<dynamic> createAccount(String address, String password) async {
    Map<String, dynamic> body = {"address": address, "password": password};

    final response = await dio.post(BaseURL.baseURL + ApiEndPoints.accounts,
        data: body,
        options: Options(headers: {"Content-Type": "application/json"}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  static Future<String?> login(Map data) async {
    try {
      var url = 'https://api.mail.tm/token';
      var res = await dio.post(url, data: data);

      return res.data['token'];
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<SigninModel?> signIn(String address, String password) async {
    Map<String, dynamic> body = {"address": address, "password": password};

    final response = await dio.post(BaseURL.baseURL + ApiEndPoints.signin,
        data: body,
        options: Options(headers: {"Content-Type": "application/json"}));

    if (response.statusCode == 200) {
      return SigninModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  static Future<List<MailDetails>?> getMails(var token) async {
    final response = await dio.get(BaseURL.baseURL + ApiEndPoints.mails,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer $token',
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return MailListModel.fromJson(response.data).hydraMember;
    } else {
      return null;
    }
  }
}
