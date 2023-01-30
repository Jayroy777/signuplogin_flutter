import 'dart:convert';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signuplogin/screens/home.dart';
import 'package:cherry_toast/cherry_toast.dart';

class LoginProviders extends ChangeNotifier {
  String _eMail = "";
  String _password = "";

  void setEmail(e) {
    _eMail = e;
    notifyListeners();
  }

  void  setPassword(p) {
    _password = p;
    notifyListeners();
  }

  Future sendLoginData(BuildContext context) async {
    debugPrint("Api Called");
    final url = Uri.parse('http://192.168.1.67:3000/api/v1/login');
    var res = await http.post(url,
        body: jsonEncode({'email': _eMail, 'password': _password}),
        headers: {'content-type': 'application/json'});
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => const Home()));
    }else{
      debugPrint("gone to else");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Wrong Credentials"),
      ));
    }
  }
}
