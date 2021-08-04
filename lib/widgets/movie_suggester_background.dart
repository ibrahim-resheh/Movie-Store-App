import 'package:flutter/material.dart';

class MovieSuggesterBackground extends StatelessWidget {
  final Widget child;
  MovieSuggesterBackground({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        //color: Colors.grey,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.6), BlendMode.dstATop),
          image: AssetImage('assets/photo.jpg'),
        ),
      ),
      child: child,
    );
  }
}
