
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:seventh_art_app/providers/movie_suggest_provider.dart';

class MovieSuggesterServices{
  static List<Map<String, dynamic>> genres = [
    {
      "id": 28,
      "name": "Action",
    },
    {
      "id": 12,
      "name": "Adventure",
    },
    {
      "id": 16,
      "name": "Animation",
    },
    {
      "id": 35,
      "name": "Comedy",
    },
    {
      "id": 80,
      "name": "Crime",
    },
    {
      "id": 99,
      "name": "Documentary",
    },
    {
      "id": 18,
      "name": "Drama",
    },
    {
      "id": 10751,
      "name": "Family",
    },
    {
      "id": 14,
      "name": "Fantasy",
    },
    {
      "id": 36,
      "name": "History",
    },
    {
      "id": 27,
      "name": "Horror",
    },
    {
      "id": 10402,
      "name": "Music",
    },
    {
      "id": 9648,
      "name": "Mystery",
    },
    {
      "id": 10749,
      "name": "Romance",
    },
    {
      "id": 878,
      "name": "Science Fiction",
    },
    {
      "id": 53,
      "name": "Thriller",
    },
    {
      "id": 10752,
      "name": "War",
    },
  ];

  static List<int> selectedIndexList = [];
  static List<int> selectedGenres = [];

  static void changeColor(int index) {
    if (MovieSuggesterServices.selectedIndexList.contains(index)) {
      MovieSuggesterServices.selectedIndexList.remove(index);
      MovieSuggesterServices.selectedGenres.remove(MovieSuggesterServices.genres[index]['id']);
    } else {
      MovieSuggesterServices.selectedIndexList.add(index);
      MovieSuggesterServices.selectedGenres.add(MovieSuggesterServices.genres[index]['id']);
    }
  }

  static Future<void> getSuggestedMovie(BuildContext context) async {
    String genresString = selectedGenres.toString();
    String finalGenres = genresString.substring(1, genresString.length - 1);
    final provider = Provider.of<MovieSuggestProvider>(context, listen: false);
    await provider.getMoviesByGenres(finalGenres);
  }


}