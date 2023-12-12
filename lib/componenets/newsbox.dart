import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/model.dart';
import 'package:tech_news_app/componenets/bottom_sheet.dart';
import 'package:tech_news_app/componenets/divider.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class NewsBox extends StatelessWidget {
  const NewsBox({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text("No data available"));
    }

    List<TrendingNews> newsList = snapshot.data;

    return Column(
      children: [
        InkWell(
          onTap: () {
            // Ensure that there is at least one item in the list
            if (newsList.isNotEmpty) {
              showMyBottomSheet(
                context,
                newsList[0].title,
                newsList[0].description,
                newsList[0].urlToImage,
                newsList[0].url,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: size.width,
            color: AppColors.black,
            child: SizedBox(
              height: size.height,
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: snapshot.data![index].urlToImage,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                                color: AppColors.primaryColor),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ModifiedText(
                              text: newsList[index].title,
                              color: AppColors.white,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 5),
                            ModifiedText(
                              text: newsList[index].publishedAt.toString(),
                              color: AppColors.lightWhite,
                              fontSize: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const DividerWidget(),
      ],
    );
  }
}
