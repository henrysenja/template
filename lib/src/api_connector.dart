import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:template/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:ucollect_app/src/model/balance_stat.dart';
// Withdraw type
enum WdType { banktrf, ewallet }

class ApiConnector {
  Future<String> getFreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    final url = Uri.parse('$kNoovoApisBase/api/app/refresh-token');

    final body = {'id': id};
    final res = await http.post(url, body: body);

    if (res.statusCode != 200) throw Exception('Failed to load');

    final data = json.decode(res.body);
    return data['token'];
  }

  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('id') == null) {
      return Future.value(false);
    }

    return Future.value(true);
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> logIn({
    required String username,
    required String password,
    required Function(String) onError,
    required Function(int) onSuccess,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // final url = Uri.parse('$kNoovoApisBase/app/login');

    // final body = {
    //   'username': username,
    //   'password': password,
    // };

    // final res = await http.post(url, body: body);

    // final status = res.statusCode;

    // final data = json.decode(res.body);

    // if (status != 200) {
    //   onError('${data['message']}');
    //   throw Exception('Failed to login. Status: $status');
    // }

    // prefs.setString('id', data['user']['_id']);
    // onSuccess(status);
    if (username != 'example' || password != '123456') {
      onError('invalid credential');
      throw Exception('Failed to login. Status: 400');
    }
    prefs.setString('id', username);

    onSuccess(200);
  }
}
