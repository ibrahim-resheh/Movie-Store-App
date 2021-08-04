import 'package:flutter/material.dart';
import 'package:seventh_art_app/widgets/genres_grid_view.dart';
import 'package:seventh_art_app/widgets/movie_suggester_background.dart';

import '../constants.dart';

class MovieSuggesterPage extends StatelessWidget {
  static const routeName = '/movie_suggester_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Seventh Art'),
      ),
      body: MovieSuggesterBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'ما نوع الفيلم الذي تحب أن تشاهده ؟',
              softWrap: true,
              overflow: TextOverflow.fade,
              style: kTitle3TextStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GenresGridView(scaffoldKey: _scaffoldKey,),
            ),
          ],
        ),
      ),
    );
  }
}
