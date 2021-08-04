import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/my_services.dart';
import '../constants.dart';


class MovieItem extends StatelessWidget {
  final int movieNumber;
  final String movieTitle;
  MovieItem({
    @required this.movieNumber,
    @required this.movieTitle,
  });




  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              bool _isConnected = await MyServices.checkConnection();
              if(_isConnected){
                String movieUrl = await MyServices.getMovieUrl(movieTitle);
                bool done = await MyServices.lunchIMDBInApp(movieUrl);
                if(!done)
                  MyServices.showSnackBar(context, 'تأكد من الاتصال بالانترنت');
              }else{
                MyServices.showSnackBar(context, 'تأكد من الاتصال بالانترنت');
              }
            },
            child: ListTile(
              leading: Chip(
                label: Text(
                  movieNumber.toString(),
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: kThirdColor.withOpacity(0.8),
              ),
              title: Text(
                movieTitle,
                style: kMovieItemTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:Divider(
              color: kThirdColor,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
