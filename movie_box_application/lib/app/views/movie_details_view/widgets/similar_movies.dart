import 'package:flutter/material.dart';
import 'package:movie_box_application/core/data/network/services/similar_movies_service.dart';
import 'package:movie_box_application/core/models/movie_model.dart';
import 'package:movie_box_application/core/widgets/movie_card.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  late Future<List<MovieModel>> simpleMoviesList;
  @override
  void initState() {
    simpleMoviesList = SimilarMoviesService.getMovies(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
        future: simpleMoviesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MovieModel> myList = snapshot.data!;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myList.length,
                itemBuilder: ((context, index) {
                  var currentMovie = myList[index];
                  return MovieCard(movieModel: currentMovie);
                }));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
