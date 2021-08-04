import 'package:flutter/material.dart';
import 'package:seventh_art_app/constants.dart';

class AboutAppPage extends StatelessWidget {
  static const routeName = '/about_page';

  Widget buildText1(String text){
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        color: kSecondaryColor,
      ),
    );
  }

  Widget buildText2(String text){
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: kEmailTextStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text('Seventh Art'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/app_icon.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            buildText1('This app was developed and released by Ibrahim Resheh, for any information:'),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: buildText2('ibrahim.re6@gmail.com'),
            ),
            const SizedBox(
              height: 20,
            ),
            buildText1('Database used for movies suggestion is provided by TMDB website:'),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: buildText2('https://www.themoviedb.org/'),
            ),
          ],
        ),
      ),
    );
  }
}
