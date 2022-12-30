import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/core/models/movie_detail_model.dart';
import 'package:movie_box_application/product/image_path.dart';

import '../../../../core/utils/constants/api_constants.dart';

class SliverFlexibleSpaceBar extends StatelessWidget {
  const SliverFlexibleSpaceBar({
    Key? key,
    required this.myModel,
    this.url,
  }) : super(key: key);

  final MovieDetailModel? myModel;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
        centerTitle: true,
        title: const Text('over_view').tr(),
        background: url == ''
            ? Image.network(
                ImagePath.instance.greyBackgroundURL,
                fit: BoxFit.fitWidth,
              )
            : CachedNetworkImage(
                imageUrl: myModel?.backdropPath == null
                    ? ImagePath.instance.placeHolderURL
                    : APIURL.baseImageUrl + myModel!.backdropPath!,
                fit: BoxFit.fitWidth,
              ));
  }
}
