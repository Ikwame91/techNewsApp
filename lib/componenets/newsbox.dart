import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

    return SizedBox(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsItem(
            news: newsList[index],
            onTap: () {
              showMyBottomSheet(
                context,
                newsList[index].title,
                newsList[index].description,
                newsList[index].urlToImage,
                newsList[index].url,
              );
            },
          );
        },
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.news, required this.onTap})
      : super(key: key);

  final TrendingNews news;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
          color: AppColors.primaryColor,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: news.urlToImage,
                imageBuilder: (context, imageProvider) => Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                  ),
                ),
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColors.primaryColor),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModifiedText(
                      text: news.title,
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 8),
                    ModifiedText(
                      // text: news.publishedAt.toString(),
                      text:
                          DateFormat.yMMMMd().add_jm().format(news.publishedAt),
                      color: AppColors.lightWhite,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 15),
                    const DividerWidget(),
                  ],
                ),
              ),
              const DividerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// class NewsBox extends StatelessWidget {
//   const NewsBox({Key? key, required this.snapshot}) : super(key: key);

//   final AsyncSnapshot snapshot;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (snapshot.hasError) {
//       return Text("${snapshot.error}");
//     } else if (!snapshot.hasData || snapshot.data == null) {
//       return const Center(child: Text("No data available"));
//     }

//     List<TrendingNews> newsList = snapshot.data;

//     return Column(
//       children: [
//         for (int index = 0; index < newsList.length; index++)
//           InkWell(
//             onTap: () {
//               if (newsList.isNotEmpty) {
//                 showMyBottomSheet(
//                   context,
//                   newsList[index].title,
//                   newsList[index].description,
//                   newsList[index].urlToImage,
//                   newsList[index].url,
//                 );
//               }
//             },
//             child: SizedBox(
//               height: size.height,
//               width: size.width,
//               child: ListView.builder(
//                 itemCount: newsList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: const EdgeInsets.all(10),
//                     margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
//                     color: AppColors.black,
//                     child: Row(
//                       children: [
//                         CachedNetworkImage(
//                           imageUrl: snapshot.data![index].urlToImage,
//                           imageBuilder: (context, imageProvider) => Container(
//                             width: 65,
//                             height: 65,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: imageProvider, fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.yellow),
//                           ),
//                           placeholder: (context, url) =>
//                               CircularProgressIndicator(
//                                   color: AppColors.primaryColor),
//                           errorWidget: (context, url, error) =>
//                               const Icon(Icons.error),
//                         ),
//                         const SizedBox(
//                           width: 12,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               ModifiedText(
//                                 text: newsList[index].title,
//                                 color: AppColors.white,
//                                 fontSize: 18,
//                               ),
//                               const SizedBox(height: 8),
//                               ModifiedText(
//                                 text: newsList[index].publishedAt.toString(),
//                                 color: AppColors.lightWhite,
//                                 fontSize: 18,
//                               ),
//                               const SizedBox(height: 15),
//                               const DividerWidget(),
//                             ],
//                           ),
//                         ),
//                         const DividerWidget(),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
