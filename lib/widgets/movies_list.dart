import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventh_art_app/providers/movies_provider.dart';
import '../constants.dart';
import 'movie_item.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final movies = moviesProvider.movies;
    final moviesState = moviesProvider.moviesState;
    if (moviesState == MoviesStateEnum.NoFilesFound) {
      return Center(
        child: Text(
          'الرجاء التأكد من وجود اتصال بالانترنت لتحميل الملفات المطلوبة.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Almarai',
            fontSize: 16,
            color: kPrimaryColor,
          ),
        ),
      );
    } else if (moviesState == MoviesStateEnum.NotEmpty) {
      return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieItem(
          movieNumber: movies[index].number,
          movieTitle: movies[index].title,
        ),
      );
    } else if (moviesState == MoviesStateEnum.NoResults) {
      return Image.asset('assets/no_results.jpg',);
    }
    return Container();
  }
}
