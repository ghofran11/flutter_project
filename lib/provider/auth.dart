import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Authprovider with ChangeNotifier{
  var _token;
  Future<bool> login(String email, String password) async {

    String api='https://reqres.in';
    final url = "$api/login";

    Map<String, String> loginData = {
      'email': email,
      'password': password,
    };

    // final response = await http.post(url, body: body,);
    Dio dio =Dio();
    final response =await dio.post(
        url,
        data: loginData
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> apiResponse = json.decode(response.data);
      //   _status = Status.Authenticated;
      _token = apiResponse['access_token'];
      //   await storeUserData(apiResponse);
         notifyListeners();
      return true;
      }
      //
       if (response.statusCode == 401) {
        Flushbar(
          title: 'Invalid email or password',
        );
      //   _status = Status.Unauthenticated;
      //   _notification = NotificationText('Invalid email or password.');
        notifyListeners();
        return false;
      }
    Flushbar(
      title: 'Server error.',
    );
      //
      // _status = Status.Unauthenticated;
      // _notification = NotificationText('Server error.');
       notifyListeners();
      return false;
    }

  }



