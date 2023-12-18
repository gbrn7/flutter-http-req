import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minggu_16/controller/user_controller.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  UserController userController = Get.put(UserController());
  TextEditingController useridController = TextEditingController();

  void clearFields() {
    useridController.text = '';
    userController.nameController.text = '';
    userController.emailController.text = '';
    userController.genderController.text = '';
    userController.statusController.text = '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Update & Delete'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: userController.nameController,
              decoration: const InputDecoration(hintText: 'name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: userController.emailController,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: userController.genderController,
              decoration: const InputDecoration(hintText: 'gender'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: userController.statusController,
              decoration: const InputDecoration(hintText: 'status'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: useridController,
              decoration: const InputDecoration(hintText: 'user id'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                userController.createUserData(useridController.text);
                clearFields();
              },
              child: const Text('create data'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                userController.fetcUserData(useridController.text);
              },
              child: const Text('get data'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                userController.updateUserData(useridController.text);
              },
              child: const Text('update data'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                userController.deleteUserData(useridController.text);
              },
              child: const Text('delete data'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                clearFields();
              },
              child: const Text('clear field'),
            ),
          ],
        ),
      ),
    );
  }
}
