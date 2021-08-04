import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventh_art_app/providers/movie_suggest_provider.dart';
import '../constants.dart';


class SuggestedMovieDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: height * 0.9,
          width: width * 0.9,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Consumer<MovieSuggestProvider>(
            builder: (ctx, provider, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: provider.moviePoster == null ||
                                provider.moviePoster.isEmpty
                            ? Image.asset(
                                'assets/art7.png',
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                '${provider.baseImageUrl}${provider.moviePoster}',
                                fit: BoxFit.fill,
                              ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.close),
                            color: kThirdColor,
                            iconSize: 30,
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            provider.movieTitle,
                            textAlign: TextAlign.center,
                            style: kMovieTitleTextStyle,
                          ),
                          Chip(
                            avatar: Icon(
                              Icons.star,
                              color: kSecondaryColor,
                              size: 20,
                            ),
                            label: Text(
                              provider.movieRate,
                              style: kMovieRateTextStyle,
                            ),
                            backgroundColor: kThirdColor,
                          ),
                          Text(
                            'Overview:',
                            textDirection: TextDirection.ltr,
                            style: kOverViewTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            provider.movieOverview,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: kMovieOverViewTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
