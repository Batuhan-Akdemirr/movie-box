import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/homepage/widgets/home_page_appbar.dart';
import 'package:movie_box_application/app/views/homepage/widgets/popular_movies.dart';
import 'package:movie_box_application/app/views/homepage/widgets/upcoming_movies.dart';
import 'package:movie_box_application/core/widgets/base_movie_card.dart';
import 'package:movie_box_application/core/widgets/base_title.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomePageAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CoreTitle(title: 'upcoming'),
            Padding(
                padding: context.horizontalPaddingNormal * 1.5 +
                    context.verticalPaddingLow,
                child: const BaseMovieCard(myWidget: UpcomingMovies())),
            const CoreTitle(title: 'popular'),
            Padding(
                padding: context.horizontalPaddingNormal * 1.5 +
                    context.verticalPaddingLow,
                child: const BaseMovieCard(myWidget: PopularMovies())),
          ],
        ));
  }
}
