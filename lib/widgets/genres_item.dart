import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/my_services.dart';

import '../constants.dart';


final activeColor = kThirdColor.withOpacity(0.7);
final inactiveColor = Colors.white70;

class GenresItem extends StatefulWidget {
  final String genresName;
  final int genresId;
  final int index;
  final Function changeColor;
  final List<int> selectedIndexList;
  final genres;

  GenresItem({
    @required this.genresName,
    @required this.genresId,
    @required this.index,
    @required this.changeColor,
    @required this.selectedIndexList,
    @required this.genres,
  });


  @override
  _GenresItemState createState() => _GenresItemState();
}

class _GenresItemState extends State<GenresItem> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          widget.changeColor(widget.index);
      },
      child: Container(
        child: Center(
            child: Text(
              widget.genresName,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: 'Roboto',
                  letterSpacing: 1,
                  fontSize: 16),
            )),
        decoration: BoxDecoration(
          color: widget.selectedIndexList.contains(widget.index)
              ? activeColor
              : inactiveColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
