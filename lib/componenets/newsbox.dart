import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_app/componenets/bottom_sheet.dart';
import 'package:tech_news_app/componenets/divider.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class NewsBox extends StatelessWidget {
  const NewsBox({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(
                context,
                snapshot.data.title,
                snapshot.data.description,
                snapshot.data.urlToImage,
                snapshot.data.url);
          },
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
              width: size.width,
              color: AppColors.black,
              child: SizedBox(
                height: size.height * 0.8,
                width: size.width,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: snapshot.data![index].urlToImage,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 65,
                              height: 65,
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
                                  text: snapshot.data![index].title,
                                  color: AppColors.white,
                                  fontSize: 18),
                              const SizedBox(
                                height: 5,
                              ),
                              ModifiedText(
                                  text: snapshot.data![index].publishedAt,
                                  color: AppColors.lightWhite,
                                  fontSize: 18),
                            ],
                          ))
                        ],
                      );
                    }),
              )),
        ),
        const DividerWidget()
      ],
    );
  }
}
