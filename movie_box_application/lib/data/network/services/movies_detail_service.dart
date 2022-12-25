import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_box_application/data/network/abstractions/movies_service.dart';
import 'package:movie_box_application/models/movie_detail_model.dart';
import 'package:movie_box_application/utils/constants/api_constants.dart';
import 'package:movie_box_application/utils/extensions/category_name_extension.dart';

class MoviesDetailService implements IMoviesService {
  final MovieDetailsModel _movieDetail = MovieDetailsModel();
  @override
  Future<MovieDetailsModel?> getMovies({String? movieName, int? id}) async {
    var response = await Dio().get(APIURL.baseApiUrl +
        BaseCategoryName.movie.getCategoryName() +
        id.toString() +
        APIURL.queryApiKeyValue +
        APIURL.apiKey);

    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;

      if (data is Map<String, dynamic>) {
        return MovieDetailsModel.fromJson(data);
      }

      return _movieDetail;
    }
    return null;
  }
}
