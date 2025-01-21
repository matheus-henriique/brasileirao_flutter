import 'package:app_test_build/pages/home/home_page.dart';
import 'package:app_test_build/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brasileirão',
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}