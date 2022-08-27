import '/presentation/features/home/controller/models/mail_model.dart';

import 'package:dio/dio.dart';

class ApiClient {
  static Dio dio = Dio();
  static Future<String?> getDomain() async {
    try {
      var url = 'https://api.mail.tm/domains';
      var res = await dio.get(url);
      print(res.data);
      return res.data['hydra:member'][0]['domain'];
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<String?> createAccount(Map data) async {
    try {
      var url = 'https://api.mail.tm/accounts';
      await dio.post(url, data: data);

      return 'success';
    } catch (e) {
      // print(e);
    }
    return null;
  }

  static Future<String?> login(Map data) async {
    try {
      var url = 'https://api.mail.tm/token';
      var res = await dio.post(url, data: data);
      print(res.data['token']);
      return res.data['token'];
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<EmailDetails>?> getMails(String token) async {
    try {
      var url = 'https://api.mail.tm/messages';
      var res = await dio.get(url,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (res.statusCode == 200) {
        var data = MailModel.fromJson(res.data);
        return data.hydraMember;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
