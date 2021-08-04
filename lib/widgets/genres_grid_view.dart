import 'package:flutter/material.dart';
import 'package:seventh_art_app/my_services/movie_suggester_services.dart';
import 'package:seventh_art_app/my_services/my_services.dart';
import 'package:seventh_art_app/widgets/suggested_movie_dialog.dart';
import '../constants.dart';
import 'genres_item.dart';

class GenresGridView extends StatefulWidget {
  //in order to use it in dispose
  final scaffoldKey;
  GenresGridView({
    @required this.scaffoldKey,
  });

  @override
  _GenresGridViewState createState() => _GenresGridViewState();
}

class _GenresGridViewState extends State<GenresGridView> {
  bool _isWaiting = false;

  void changeMovieItemColor(int index) {
    MovieSuggesterServices.changeColor(index);
    setState(() {});
  }

  @override
  void dispose() {
    MovieSuggesterServices.selectedGenres.clear();
    MovieSuggesterServices.selectedIndexList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          itemCount: MovieSuggesterServices.genres.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => GenresItem(
            index: index,
            genresName: MovieSuggesterServices.genres[index]['name'],
            genresId: MovieSuggesterServices.genres[index]['id'],
            changeColor: changeMovieItemColor,
            selectedIndexList: MovieSuggesterServices.selectedIndexList,
            genres: MovieSuggesterServices.genres,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _isWaiting
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kThirdColor),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kThirdColor.withOpacity(0.7),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  ),
                  onPressed: MovieSuggesterServices.selectedIndexList.isEmpty
                      ? null
                      : () async {
                          if(MovieSuggesterServices.selectedIndexList.length < 3){
                            setState(() {
                              _isWaiting = true;
                            });
                            bool _isConnected =
                            await MyServices.checkConnection();
                            if (_isConnected) {
                              await MovieSuggesterServices.getSuggestedMovie(
                                  context);
                              showDialog(
                                context: context,
                                builder: (ctx) => SuggestedMovieDialog(),
                                barrierDismissible: false,
                              );
                            } else {
                              MyServices.showSnackBar(
                                  context, 'تأكد من الاتصال بالانترنت');
                            }
                            setState(() {
                              _isWaiting = false;
                            });
                          }else{
                            MyServices.showSnackBar(context, 'عذراً، لا يمكنك اختيار أكثر من ثلاث فئات.');
                          }

                        },
                  child: Text(
                    'تأكيد',
                    style: kButtonTextStyle.copyWith(color: kSecondaryColor),
                  ),
                ),
        ),
      ],
    );
  }
}
