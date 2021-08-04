import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/my_services.dart';

import '../constants.dart';

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController _searchController = TextEditingController();
  bool _isWaiting = false;

  Future<void> searchForMovies(BuildContext context)async{
    FocusScope.of(context).requestFocus(FocusNode());
    if(_searchController.text.length > 3){
      await MyServices.searchForMovies(_searchController.text, context);
    }else{
      MyServices.showSnackBar(context, 'الرجاء إدخال 4 حروف على الأقل');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isWaiting ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(kThirdColor),) : TextField(
      controller: _searchController,
      textInputAction: TextInputAction.search,
      textDirection: TextDirection.ltr,
      onSubmitted: (userInput) async {
        setState(() {
          _isWaiting = true;
        });
        await searchForMovies(context);
        setState(() {
          _isWaiting = false;
        });
      },
      style: TextStyle(
        color: kThirdColor,
        fontFamily: 'Roboto',
        height: 1,
      ),
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () async {
            setState(() {
              _isWaiting = true;
            });
            await searchForMovies(context);
            setState(() {
              _isWaiting = false;
            });
          },
          color: kThirdColor,
        ),
        filled: true,
        fillColor: kSecondaryColor,
        hintText: 'ابحث عن فيلم',
        hintStyle: kHintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
