import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
import 'package:tech_news_app/backend/model.dart';
import 'package:tech_news_app/componenets/appbar.dart';
import 'package:tech_news_app/componenets/newsbox.dart';
import 'package:tech_news_app/componenets/search_bar.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/constants.dart';

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
              SizedBox(
                height: size.height * 0.8,
                width: size.width,
                child: FutureBuilder(
                    future: fetchNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return NewsBox(
                                imageurl: snapshot.data![index]['urlToImage'] ??
                                    Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                                url: snapshot.data![index]['url']);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
