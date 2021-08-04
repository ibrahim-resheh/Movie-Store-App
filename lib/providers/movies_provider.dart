import 'dart:convert';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:seventh_art_app/my_services/database_services.dart';
import '../constants.dart';
import 'dart:io';
import 'package:charset_converter/charset_converter.dart';

class Movie {
  int number;
  String title;

  Movie({
    @required this.number,
    @required this.title,
  });
}

class MoviesProvider with ChangeNotifier {
  List<Movie> _movies = [];
  MoviesStateEnum _moviesState = MoviesStateEnum.Empty;

  MoviesStateEnum get moviesState => _moviesState;
  List<Movie> get movies => [..._movies];

  Future<void> getNewMovies() async {
    List<Movie> fetchedMovies = [];
    String dirPath = await DatabaseServices.getPath();
    String filePath = "$dirPath/NewMovies.xlsx";
    final file = File(filePath);
    bool isFileExists = await file.exists();
    if(isFileExists){
      var bytes = await file.readAsBytes();
      final excel = Excel.decodeBytes(bytes);
      Sheet sheet = excel.sheets['Sheet1'];
      List<dynamic> rowsList = sheet.rows.toList();
      for (int rowIndex = 1; rowIndex < rowsList.length; rowIndex++) {
        var row = rowsList[rowIndex];
        int movieNumber = row[0] ?? 0;
        String movieTitle = row[1] ?? ' ';
        fetchedMovies.add(Movie(number: movieNumber, title: movieTitle));
      }
      _moviesState = fetchedMovies.isEmpty ? MoviesStateEnum.NoResults : MoviesStateEnum.NotEmpty;
      _movies = fetchedMovies;
    }else{
      _moviesState = MoviesStateEnum.NoFilesFound;
    }
    notifyListeners();
  }

  Future<void> getMoviesBySearch(String textToFind) async {
    textToFind = textToFind.toLowerCase();
    List<Movie> fetchedMovies = [];
    String dirPath = await DatabaseServices.getPath();
    String filePath = "$dirPath/Archive.csv";
    final file = File(filePath);
    bool isFileExists = await file.exists();
    if (isFileExists) {
      var bytes = await file.readAsBytes();
      String decoded = await CharsetConverter.decode("windows-1256", bytes);
      List<String> linesOfString = LineSplitter().convert(decoded).toList();
      fetchedMovies = searchForMovies(linesOfString, textToFind);
      _moviesState = fetchedMovies.isEmpty ? MoviesStateEnum.NoResults : MoviesStateEnum.NotEmpty;
      _movies = fetchedMovies;
    }else{
      _moviesState = MoviesStateEnum.NoFilesFound;
    }
    notifyListeners();
  }

  List<Movie> searchForMovies(List<String> linesOfString, String textToFind){
    List<Movie> foundMovies = [];
    try{
      linesOfString.forEach((line) {
        if (line.toLowerCase().contains(textToFind)){
          List<String> movieLine = line.split(',').reversed.toList();
            int movieNumber = int.parse(movieLine[2]);
            String movieTitle = movieLine[6].isEmpty ? movieLine[5] : movieLine[6]+' '+movieLine[5];
            foundMovies.add(Movie(number: movieNumber, title: movieTitle));
        }
      });
      return foundMovies;
    }catch(error){
      return [];
    }
  }


}