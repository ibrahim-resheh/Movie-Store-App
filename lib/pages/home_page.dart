import 'package:flutter/material.dart';
import 'package:seventh_art_app/widgets/home_page_body.dart';
import 'package:seventh_art_app/widgets/home_page_header.dart';
import 'package:seventh_art_app/widgets/my_drawer.dart';
import '../constants.dart';
import 'movie_suggester_page.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //to dismiss on screenKeyboard when tab outside of textField
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: MyDrawer(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: kPrimaryColor,
                  child: HomePageHeader(),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: HomePageBody(),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(MovieSuggesterPage.routeName);
                },
                child: Container(
                  color: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Text(
                      'ساعدني، ماذا أشاهد؟',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
