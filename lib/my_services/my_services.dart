import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:provider/provider.dart';
import 'package:seventh_art_app/providers/movies_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MyServices {

  static Future<bool> checkConnection() async {
    try{
      final result = await InternetAddress.lookup('www.google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    }on SocketException catch(e){
      return false;
    }catch(e){
      return false;
    }
  }

  static Future<bool> lunchIMDBInApp(String url)async{
    try{
      if(await canLaunch(url)){
        await launch(
          url,
          forceWebView: true,
          forceSafariVC: true,
        );
        return true;
      }else{
        return false;
      }
    }catch(error){
      return false;
    }
  }

  static Future<bool> openFacebookPage()async{
    String url = 'https://www.facebook.com/seventhart.lattakia';
    try{
      if(await canLaunch(url)){
        bool openFromApp = await launch(
          url,
          forceSafariVC: false,
          forceWebView: false,
          universalLinksOnly: true,
        );
        if(!openFromApp){
          print('no app');
          await launch(
            url,
            forceWebView: true,
            forceSafariVC: true,
          );
        }
        return true;
      }else{
        return false;
      }
    }catch (error){
      return false;
    }
  }

  static Future<void> searchForMovies(String textToFind, BuildContext context) async {
    final provider = Provider.of<MoviesProvider>(context, listen: false);
    await provider.getMoviesBySearch(textToFind);
  }

  static Future<void> getNewMovies(BuildContext context) async {
    final provider = Provider.of<MoviesProvider>(context, listen: false);
    await provider.getNewMovies();
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: TextStyle(
          fontFamily: 'Almarai',
          color: Colors.red,
        ),),
      ),
    );
  }

  static Future<String> getMovieUrl(String movieTitle) async {
    final url = 'https://www.imdb.com/find?q=$movieTitle';
    final response = await http.get(Uri.parse(url));
    final data = response.body;
    var document = parse(data);
    var element = document.querySelectorAll('table.findList').first.getElementsByTagName('a').first;
    final movieId = element.attributes["href"];
    final movieUrl = "https://m.imdb.com$movieId";
    return movieUrl;
  }
}
