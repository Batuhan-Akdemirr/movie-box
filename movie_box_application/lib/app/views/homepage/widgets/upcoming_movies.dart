import 'package:flutter/material.dart';
import 'package:movie_box_application/core/data/network/abstractions/movies_service.dart';
import 'package:movie_box_application/core/data/network/services/upcoming_movies_service.dart';
import 'package:movie_box_application/core/models/movie_model.dart';
import 'package:movie_box_application/core/widgets/movie_card.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({Key? key}) : super(key: key);

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  late final Future<List<MovieModel>>? _upCommingMovie;
  IMoviesService upcommingMovieApi = UpcomingMoviesService();
  @override
  void initState() {
    super.initState();

    _upCommingMovie = upcommingMovieApi.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
        future: _upCommingMovie,
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
