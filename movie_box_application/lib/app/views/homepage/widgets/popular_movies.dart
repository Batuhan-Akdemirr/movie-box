import 'package:flutter/material.dart';
import 'package:movie_box_application/core/data/network/services/popular_movie_service.dart';
import 'package:movie_box_application/core/data/network/services/service_library.dart';
import 'package:movie_box_application/core/widgets/movie_card.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  late final Future<List<MovieModel>>? _popularMovies;
  final IMoviesService _popularService = PopularMoviesService();

  @override
  void initState() {
    super.initState();

    _popularMovies = _popularService.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
        future: _popularMovies,
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
