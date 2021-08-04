import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieSuggestProvider with ChangeNotifier {
  static const API_KEY = 'c05b8485c000dc72be953e71932dd60e';
  static const _BASE_IMAGE_URL =
      "https://image.tmdb.org/t/p/w600_and_h900_bestv2";
  String _movieTitle = ' ';
  String _movieOverview = ' ';
  String _movieRate = ' ';
  String _moviePoster = '';

  String get baseImageUrl => _BASE_IMAGE_URL;

  String get movieTitle => _movieTitle;

  String get movieOverview => _movieOverview;

  String get movieRate => _movieRate;

  String get moviePoster => _moviePoster;

  Future<int> getRandomPageNumber(String genres) async {
    String url = 'https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY&language=en-US&sort_by=popularity.desc&page=1&with_genres=$genres';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final totalPages = data['total_pages'];
        print(totalPages);
        var random = Random();
        final randomPage = random.nextInt(totalPages) + 1;
        print(randomPage);
        return randomPage;
      }
      return 1;
    } catch (error) {
      return 1;
    }
  }

  Future<void> getMoviesByGenres(String genres) async {
    print(genres);
    int pageNumber = await getRandomPageNumber(genres);
    String url = 'https://api.themoviedb.org/3/discover/movie?api_key=$API_KEY&language=en-US&sort_by=popularity.desc&page=$pageNumber&with_genres=$genres';
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        //print(data);
        var random = Random();
        // in case results weren't 20 movies
        List<dynamic> results = data['results'];
        final randomMovieIndex = random.nextInt(results.length);
        print(randomMovieIndex);
        print(data['results'][randomMovieIndex]);
        var chosenMovie = data['results'][randomMovieIndex];
        _movieTitle = chosenMovie['title'];
        _movieOverview = chosenMovie['overview'];
        _movieRate = chosenMovie['vote_average'].toString();
        _moviePoster = chosenMovie['poster_path'];
        print('$_movieTitle $_moviePoster $_movieRate $_movieOverview');
      }
    }catch(error){
      print(error.toString());
    }
    notifyListeners();
  }

}
