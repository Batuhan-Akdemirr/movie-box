import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';

class CoreTitle extends StatelessWidget {
  const CoreTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal * 1.5 +
          context.onlyTopPaddingNormal * 1.5 +
          context.onlyBottomPaddingNormal,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
      ).tr(),
    );
  }
}

