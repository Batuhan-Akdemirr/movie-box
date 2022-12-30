import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/movie_details_view/widgets/similar_movies.dart';
import 'package:movie_box_application/core/models/movie_detail_model.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';
import 'package:movie_box_application/core/widgets/base_movie_card.dart';

class SliverBodyBaseColumn extends StatelessWidget {
  const SliverBodyBaseColumn(
      {super.key,
      required this.myModel,
      required this.starList,
      required this.chipList});
  final MovieDetailModel? myModel;
  final List<Widget> starList;
  final List<Widget> chipList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: context.onlyTopPaddingNormal * 1.5,
          child: Text(
            myModel?.title ?? '',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: context.onlyTopPaddingLow * 0.75,
          child: Text(
            myModel?.releaseDate == ''
                ? ''
                : '(${myModel!.releaseDate.toString().substring(0, 4)})',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: context.onlyTopPaddingLow,
          child: Row(children: starList),
        ),
        Padding(
          padding: context.onlyTopPaddingLow * 1.5,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, child: Row(children: chipList)),
        ),
        Padding(
            padding: context.onlyTopPaddingLow * 1.5,
            child: Text(
              'story_line',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ).tr()),
        Padding(
          padding: context.onlyTopPaddingLow,
          child: Text(
            myModel!.overview ?? 'Not available',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  wordSpacing: 1.5,
                ),
          ),
        ),
        Padding(
          padding: context.onlyTopPaddingNormal * 1.5,
          child: Text(
            'similar_movies',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ).tr(),
        ),
        Padding(
          padding: context.verticalPaddingNormal * 1.5,
          child: BaseMovieCard(
            myWidget: SimilarMovies(id: myModel?.id ?? 0),
          ),
        ),
      ],
    );
  }
}
