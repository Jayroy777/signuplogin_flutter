import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../screens/home.dart';
class SignUpProviders extends ChangeNotifier{

  String _name = "";
  String _phone = "";
  String _email = "";
  String _address = "";
  String _password = "";

  void setName (name){
    _name = name;
  }
  void setPhone (phone){
    _phone = phone;
  }
  void setEmail(email){
    _email = email;
  }
  void setAddress(address){
    _address = address;
  }
  void setPassword(password){
    _password = password;
  }


  Future signUp(BuildContext context)async{
    debugPrint("signup api called");
    final url = Uri.parse('http://192.168.1.67:3000/api/v1/signup');
    var res = await http.post(url,
        body: jsonEncode({
          'name':_name,
          'phone':_phone,
          'email': _email,
          'address':_address,
          'password': _password,
        }),
        headers: {'content-type': 'application/json'});
    if (res.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account Created"),
      ));
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => const Home()));
    }else if(res.statusCode == 409){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Same Email"),
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something Went Wrong"),
      ));
    }
  }




}