import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/movie_details_view/movie_details.view.dart';
import 'package:movie_box_application/app/views/movie_details_view/widgets/genres_chip.dart';
import 'package:movie_box_application/core/data/network/services/service_library.dart';
import 'package:movie_box_application/core/utils/star_calculator.dart';
import 'package:movie_box_application/product/image_path.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../core/data/network/services/movies_detail_service.dart';
import '../../../core/utils/constants/color_constants.dart';

abstract class MovieDetailsViewModel extends State<MovieDetailView> {
  IMoviesService service = MoviesDetailService();
  late final Future<MovieDetailModel?> movieDetails;
  Color appBarColor = ColorConstants.sliverAppBarColor;
  late PaletteGenerator generator;
  late List<Widget> starList;
  late List<Genres> genreList = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    movieDetails = service.getMovies(id: widget.id);
    WidgetsBinding.instance.addPostFrameCallback((_) => _findAppBarColor());
    starList = StarCalculate.getStars(
      rating: widget.rating,
    );
    _getGenreList();
  }

   List<Widget> chipGenreList() {
    List<Widget> temp = [];
    for (var item in genreList) {
      temp.add(GenresChip(
        label: item,
      ));
    }

    return temp;
  }


  void _getGenreList() async {
    genreList = await movieDetails.then((value) => value!.genres!);
  }

  String _findImage() {
    if (widget.url == '') {
      return ImagePath.instance.placeHolderURL;
    } else {
      return APIURL.baseImageUrl + widget.url;
    }
  }

  void _findAppBarColor() async {
    generator =
        await PaletteGenerator.fromImageProvider(NetworkImage(_findImage()));

    setState(() {
      appBarColor = generator.dominantColor!.color;
    });
  }
}
