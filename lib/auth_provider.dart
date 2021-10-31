import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jag_cab/utils/apis.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> signUp(
      String name, String email, String phone, String pass) async {
    String? fcmID = await FirebaseMessaging.instance.getToken();

    var res = await http.Client().post(registerApi, body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': pass,
      'confirm_password': pass,
      'fcm_id': fcmID
    });

    if (res.statusCode == 200) {
      print(res.body);
    } else
      print(res.body);
  }
}
