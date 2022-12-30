import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/app/routes/navigator_routes.dart';
import 'package:movie_box_application/core/data/network/services/service_library.dart';
import 'package:movie_box_application/core/utils/extensions/context_extension.dart';
import 'package:movie_box_application/product/image_path.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;

  final String errorMessage = 'Bu içeriğe ulaşılamıyor';
  const MovieCard({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(NavigateRoutes.moviedetails.name, arguments: movieModel);
        },
        child: Card(
          child: CachedNetworkImage(
              imageUrl: movieModel.posterPath == null
                  ? ImagePath.instance.placeHolderURL
                  : APIURL.baseImageUrl + movieModel.posterPath!,
              fit: BoxFit.fitHeight,
              errorWidget: ((context, url, error) => Center(
                      child: Padding(
                    padding: context.horizontalPaddingLow +
                        context.verticalPaddingLow,
                    child: Text(errorMessage),
                  )))),
        ));
  }
}
