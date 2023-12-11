import 'package:flutter/material.dart';
import 'package:tech_news_app/pages/home.dart';
import 'package:tech_news_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
