import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/routes/pages.dart';
import 'package:hq_characters/app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Characters HQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
