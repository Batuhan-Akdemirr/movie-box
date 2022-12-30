import 'package:flutter/material.dart';
import 'package:movie_box_application/core/models/movie_detail_model.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';

class GenresChip extends StatelessWidget {
  const GenresChip({
    Key? key,
    required this.label,
  }) : super(key: key);
  final Genres label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyRightPaddingLow * 1.5,
      child: Chip(
        label: Text(
          label.name ?? '',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
