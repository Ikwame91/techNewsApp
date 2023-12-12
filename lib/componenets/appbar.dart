import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';

class Apbar extends StatelessWidget implements PreferredSizeWidget {
  const Apbar({super.key}) : preferredSize = const Size.fromHeight(50);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldText(text: 'Tech', color: AppColors.primaryColor, size: 23),
              ModifiedText(
                  text: 'News', color: AppColors.lightWhite, fontSize: 20)
            ],
          )),
    );
  }
}
