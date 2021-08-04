import 'package:flutter/material.dart';

import 'movies_list.dart';
import 'new_movies_button.dart';



class HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NewMoviesButton(),
        SizedBox(height: 10,),
        Expanded(
          child: MoviesList(),
        ),
      ],
    );
  }
}
