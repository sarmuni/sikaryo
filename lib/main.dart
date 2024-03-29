import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikaryo/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sikaryo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homeUser',
      getPages: [
        GetPage(name: '/homeUser', page: () => HomeUser() ),
        GetPage(name: '/addUser', page: () => AddUser() ),
        GetPage(name: '/editUser', page: () => EditUser() ),
      ],
    );
  }
}



