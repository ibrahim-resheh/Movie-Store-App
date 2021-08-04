import 'package:flutter/material.dart';
import 'package:seventh_art_app/widgets/search_text_field.dart';
import '../constants.dart';

class HomePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الفن السابع',
                style: kTitle1TextStyle,
              ),
              Row(
                children: [
                  Text(
                    'ابحث عن فيلمك في أرشيفنا ',
                    style: kTitle2TextStyle,
                  ),
                  Text(
                    '. .',
                    style: kTitle2TextStyle.copyWith(
                      color: kThirdColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SearchTextField(),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: kSecondaryColor,
                size: 30,
              ),
              onPressed: () {
              Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      );
  }
}