import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/search_view/widgets/movie_background.dart';
import 'package:movie_box_application/core/utils/constants/color_constants.dart';
import 'package:movie_box_application/core/utils/star_calculator.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';

class SearchCard extends StatefulWidget {
  final String? posterPath;
  final String title;
  final String year;
  final String description;
  final double rating;

  const SearchCard({
    Key? key,
    required this.posterPath,
    required this.title,
    required this.year,
    required this.description,
    required this.rating,
  }) : super(key: key);

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  late List<Widget> starList;
  final String errorMessage = 'Bu içeriğe ulaşılamıyor';

  @override
  void initState() {
    starList = StarCalculate.getStars(rating: widget.rating);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.searchCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Center(
          child: MovieBackground(posterPath: widget.posterPath),
        )),
        Padding(
          padding: context.onlyLeftPaddingLow + context.onlyTopPaddingLow,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: context.onlyLeftPaddingLow + context.onlyTopPaddingLow * 0.2,
          child: Text(
            widget.year,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: context.onlyLeftPaddingLow + context.onlyTopPaddingLow * 0.2,
          child: Row(
            children: starList,
          ),
        ),
        Padding(
          padding: context.onlyLeftPaddingLow +
              context.onlyTopPaddingLow * 0.2 +
              context.onlyBottomPaddingNormal,
          child: Text(
            widget.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ]),
    );
  }
}
