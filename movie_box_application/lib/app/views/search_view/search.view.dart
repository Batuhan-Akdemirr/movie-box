import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/search_view/widgets/search_card.dart';
import 'package:movie_box_application/core/data/network/services/search_movies_service.dart';
import 'package:movie_box_application/core/data/network/services/service_library.dart';
import 'package:movie_box_application/core/utils/constants/search_gridview_constants.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';

class SearchPage extends StatefulWidget {
  final String movieName;
  const SearchPage({Key? key, required this.movieName}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final Future<List<MovieModel>> _mySearchList;

  final IMoviesService _searchMovieService = SearchMoviesService();

  @override
  void initState() {
    _mySearchList = _searchMovieService.getMovies(movieName: widget.movieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<MovieModel>>(
      future: _mySearchList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MovieModel> myList = snapshot.data!;
          return Padding(
            padding:
                context.horizontalPaddingNormal + context.verticalPaddingNormal,
            child: GridView.builder(
                itemCount: myList.length,
                gridDelegate: _gridviewConstant(),
                itemBuilder: (BuildContext context, int index) {
                  var currentMovie = myList[index];
                  var year = currentMovie.releaseDate == ''
                      ? ''
                      : currentMovie.releaseDate.toString().substring(0, 4);
                  return Container(
                      margin: context.horizontalPaddingLow * 0.25,
                      child: InkWell(
                        child: SearchCard(
                            rating: currentMovie.voteAverage!.toDouble(),
                            posterPath: currentMovie.backdropPath,
                            title: currentMovie.title!,
                            year: year,
                            description: currentMovie.overview!),
                      ));
                }),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridviewConstant() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: GridviewConstants.mainAxisSpacingConstant,
        crossAxisSpacing: GridviewConstants.crossAxisSpacingConstant,
        crossAxisCount: GridviewConstants.crossAxisCountConstant,
        mainAxisExtent: GridviewConstants.mainAxisExtentConstant);
  }
}
