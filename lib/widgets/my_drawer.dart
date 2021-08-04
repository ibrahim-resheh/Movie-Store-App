import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/my_services.dart';
import 'package:seventh_art_app/pages/about_app_page.dart';
import 'package:seventh_art_app/pages/who_is_us_page.dart';
import 'package:seventh_art_app/widgets/splash_page_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class MyDrawer extends StatelessWidget {

  Widget buildListTile(BuildContext context, String destination, IconData iconData, String text){
    return ListTile(
      onTap: ()async{
        if(destination == 'who is us')
          Navigator.of(context).pushNamed(WhoIsUsPage.routeName);
        else if(destination == 'about app')
          Navigator.of(context).pushNamed(AboutAppPage.routeName);
        else{
          bool isConnected = await MyServices.checkConnection();
          if(isConnected)
            MyServices.openFacebookPage();
          else
            MyServices.showSnackBar(context, 'تأكد من الاتصال بالانترنت');
        }
      },
      leading: Icon(
        iconData,
        color: kThirdColor,
        size: 30,
      ),
      title: Text(
        text,
        style: kListTileTextStyle,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: kPrimaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SplashPageText(
                        fontSize: 28,
                        fontFamily: 'Almarai',
                        text2: 'السابع',
                        text1: 'الفن ',
                        color: kSecondaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SplashPageText(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        text2: 'Latakia',
                        text1: 'Movie Store - ',
                        color: kSecondaryColor,
                        letterSpacing: 0.5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      buildListTile(context, 'who is us', Icons.account_circle, 'من نحن'),
                      buildListTile(context, 'about app', Icons.info, 'عن التطبيق'),
                      buildListTile(context, 'facebook page', Icons.person, 'صفحتنا على الفيس بوك'),
                    ],
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
