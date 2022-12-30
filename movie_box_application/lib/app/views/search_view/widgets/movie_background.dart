import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/core/utils/constants/api_constants.dart';
import 'package:movie_box_application/product/image_path.dart';

class MovieBackground extends StatelessWidget {
  const MovieBackground({super.key, required this.posterPath});
  final String? posterPath;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
        imageUrl: posterPath == null
            ? ImagePath.instance.placeHolderURL
            : APIURL.baseImageUrl + posterPath!,
        errorWidget: (context, url, error) {
          return Expanded(
            child: Image.network(
              APIURL.baseImageUrl,
              fit: BoxFit.fitWidth,
            ),
          );
        },
      ),
    );
  }
}
