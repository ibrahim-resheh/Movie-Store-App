import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:seventh_art_app/pages/about_app_page.dart';
import 'package:seventh_art_app/pages/home_page.dart';
import 'package:seventh_art_app/pages/movie_suggester_page.dart';
import 'package:seventh_art_app/pages/splash_page.dart';
import 'package:seventh_art_app/pages/who_is_us_page.dart';
import 'package:seventh_art_app/providers/movie_suggest_provider.dart';
import 'package:seventh_art_app/providers/movies_provider.dart';

import 'constants.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  //set status bar to transparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      // //systemNavigationBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieSuggestProvider(),
        ),
      ],
      child: SeventhArtApp(),
    ),
  );
}

class SeventhArtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale:
            Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          scaffoldBackgroundColor: kSecondaryColor,
          appBarTheme: AppBarTheme(
            textTheme: kAppBarTextTheme,
            centerTitle: true,
            elevation: 0,
          ),
        ),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => SplashPage(),
          HomePage.routeName: (context) => HomePage(),
          MovieSuggesterPage.routeName: (context) => MovieSuggesterPage(),
          WhoIsUsPage.routeName: (context) => WhoIsUsPage(),
          AboutAppPage.routeName: (context) => AboutAppPage(),
        },
      ),
    );
  }
}
