import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minggu_16/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  UserModel? userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  fetcUserData(String userid) async {
    var token = "";
    try {
      var header = {
        'content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      http.Response response = await http.get(
          Uri.tryParse('https://gorest.co.in/public/v2/users/$userid')!,
          headers: header);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        userModel = UserModel.fromJson(result);
        nameController.text = result['name'];
        emailController.text = result['email'];
        genderController.text = result['gender'];
        statusController.text = result['status'];
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print(e);
    }
  }

  updateUserData(String userid) async {
    var token = "";
    try {
      var body = {
        'name': nameController.text,
        'email': emailController.text,
        'gender': genderController.text,
        'status': statusController.text,
      };

      http.Response response = await http.put(
        Uri.tryParse('https://gorest.co.in/public/v2/users/${userid}')!,
        body: jsonEncode(body),
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('data updated');
        print(json);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print(e);
    }
  }

  createUserData(String userid) async {
    var token = "";
    try {
      var body = {
        'name': nameController.text,
        'email': emailController.text,
        'gender': genderController.text,
        'status': statusController.text,
      };

      http.Response response = await http.post(
        Uri.tryParse('https://gorest.co.in/public/v2/users')!,
        body: jsonEncode(body),
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print('data created');
        print(json);
      } else {
        print(response.body);
        print('error fetching data');
      }
    } catch (e) {
      print(e);
    }
  }

  deleteUserData(String userid) async {
    var token = "";
    try {
      http.Response response = await http.delete(
        Uri.tryParse('https://gorest.co.in/public/v2/users/${userid}')!,
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 204) {
        // final json = jsonDecode(response.body);
        print('delete data ${userid} success');
        // print(json);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print(e);
    }
  }
}
