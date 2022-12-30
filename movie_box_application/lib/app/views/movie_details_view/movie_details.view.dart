import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/movie_details_view/movie_details.viewmodel.dart';
import 'package:movie_box_application/app/views/movie_details_view/widgets/sliver_body_base_column.dart';
import 'package:movie_box_application/core/utils/constants/color_constants.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';
import 'package:movie_box_application/app/views/movie_details_view/widgets/sliver_flexible_space_bar.dart';
import 'package:movie_box_application/core/data/network/services/service_library.dart';
import 'package:movie_box_application/core/utils/constants/sliver_appbar_constants.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({
    Key? key,
    required this.id,
    required this.url,
    required this.rating,
  }) : super(key: key);

  final int id;
  final String url;
  final double rating;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends MovieDetailsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<MovieDetailModel?>(
            future: movieDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                MovieDetailModel? myModel = snapshot.data;
                return CustomScrollView(slivers: [
                  SliverAppBar(
                    expandedHeight: SliverAppBarConstants.expandedHeight,
                    pinned: true,
                    backgroundColor:
                        widget.url == ' ' ? ColorConstants.noBavkgroundImageColor: appBarColor,
                    flexibleSpace: SliverFlexibleSpaceBar(
                        myModel: myModel, url: widget.url),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: context.horizontalPaddingNormal * 1.5,
                            child: SliverBodyBaseColumn(
                                myModel: myModel,
                                starList: starList,
                                chipList: chipGenreList()))),
                  )
                ]);
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
