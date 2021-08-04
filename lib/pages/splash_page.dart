import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/database_services.dart';
import 'package:seventh_art_app/widgets/splash_page_text.dart';

import 'home_page.dart';


class SplashPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    DatabaseServices.checkVersion();
    Future.delayed(
      Duration(seconds: 5),
    ).then(
          (_) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      },
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 75,
                left: 75,
                right: 75,
              ),
              width: double.infinity,
              child: Image.asset('assets/logo.png'),
            ),
            SplashPageText(
              text1: 'الفن ',
              text2: 'السابع',
              fontFamily: 'Almarai',
              fontSize: 48,
            ),
            const SizedBox(
              height: 30,
            ),
            SplashPageText(
              text1: 'Movie Store - ',
              text2: 'Latakia',
              fontFamily: 'Roboto',
              fontSize: 18,
              letterSpacing: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
