import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff363636);
const kSecondaryColor = Colors.white;
const kThirdColor = Color(0xff13EA8C);

enum MoviesStateEnum {
  Empty,
  NoResults,
  NotEmpty,
  NoFilesFound,
}

const kAppBarTextTheme = TextTheme(
  headline6: TextStyle(
    fontFamily: 'Roboto',
    //fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.5,
  ),
);

const kTitle1TextStyle = TextStyle(
  fontFamily: 'Almarai',
  fontWeight: FontWeight.bold,
  fontSize: 28,
  color: kSecondaryColor,
);

const kListTileTextStyle = TextStyle(
  fontSize: 18,
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Almarai',
);

const kTitle3TextStyle = TextStyle(
  fontFamily: 'Almarai',
  fontWeight: FontWeight.bold,
  fontSize: 28,
  color: kPrimaryColor,
);

const kTitle2TextStyle = TextStyle(
  fontFamily: 'Almarai',
  //fontWeight: FontWeight.bold,
  fontSize: 20,
  color: kSecondaryColor,
);

const kButtonTextStyle = TextStyle(
    fontSize: 18, color: kThirdColor, letterSpacing: 1, fontFamily: 'Almarai');

const kEmailTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  color: kThirdColor,
);

const kHintTextStyle = TextStyle(
  color: kThirdColor,
  fontFamily: 'Almarai',
  //fontWeight: FontWeight.bold,
  height: 1,
);

const kMovieTitleTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 22,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
);

const kMovieRateTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  color: kSecondaryColor,
  fontWeight: FontWeight.bold,
);

const kOverViewTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  fontFamily: 'Roboto',
  color: kThirdColor,
);

const kMovieOverViewTextStyle = TextStyle(
    fontFamily: 'Roboto', fontSize: 16, color: kPrimaryColor, letterSpacing: 1);

const kMovieItemTextStyle = TextStyle(
  fontSize: 18,
  letterSpacing: 0.5,
  color: kPrimaryColor,
  fontFamily: 'Roboto',
);
