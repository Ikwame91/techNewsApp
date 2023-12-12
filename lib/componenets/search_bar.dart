import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/utils/colors.dart';

class SearchBarr extends StatefulWidget {
  const SearchBarr({super.key});

  static TextEditingController searchController =
      TextEditingController(text: '');

  @override
  State<SearchBarr> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarr> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: SearchBarr.searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              SearchBarr.searchController.clear();
                            });
                          },
                          icon: const Icon(Icons.clear, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.search,
                color: AppColors.lightWhite,
              ),
            ),
          ),
        )
      ],
    );
  }
}
