import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/my_services.dart';

import '../constants.dart';

class NewMoviesButton extends StatelessWidget {
  final ButtonStyle _buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )),
    backgroundColor: MaterialStateProperty.all(kThirdColor),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _buttonStyle,
      onPressed: () async {
        await MyServices.getNewMovies(context);
      },
      child: Text(
        'أجدد 25 فيلم لدينا',
        style: kButtonTextStyle.copyWith(
          color: kSecondaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
