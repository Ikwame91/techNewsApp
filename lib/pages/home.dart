import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/backend/model.dart';
import 'package:tech_news_app/componenets/appbar.dart';
import 'package:tech_news_app/componenets/newsbox.dart';
import 'package:tech_news_app/componenets/search_bar.dart';
import 'package:tech_news_app/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<TrendingNews>> newsList;

  @override
  void initState() {
    super.initState();
    newsList = NewsApi().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const Apbar(),
      body: ListView(
        children: [
          Column(
            children: [
              const SearchBarr(),
              FutureBuilder(
                  future: newsList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return NewsBox(snapshot: snapshot);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
