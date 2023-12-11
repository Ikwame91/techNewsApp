import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/componenets/search_bar.dart';
import 'package:tech_news_app/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> newsList;

  @override
  void initState() {
    super.initState();
    newsList = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        title: const Text('Tech News'),
        centerTitle: true,
      ),
      body: Column(
        children: [SearchBarr(), Expanded(child: Container())],
      ),
    );
  }
}
