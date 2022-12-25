import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_box_application/data/network/abstractions/movies_service.dart';
import 'package:movie_box_application/models/movie_model.dart';
import 'package:movie_box_application/product/network_manager.dart';
import 'package:movie_box_application/utils/constants/api_constants.dart';
import 'package:movie_box_application/utils/extensions/category_name_extension.dart';
import 'package:movie_box_application/utils/extensions/movie_category_name_extension.dart';

class PopularMoviesService implements IMoviesService {
  @override
  Future<List<MovieModel>> getMovies({String? movieName, int? id}) async {
    List<MovieModel> temp = [];

    var response = await NetworkManager.instance.dio.get(APIURL.baseApiUrl +
        BaseCategoryName.movie.getCategoryName() +
        MovieCategoryName.popular.getCategoryName() +
        APIURL.queryApiKeyValue +
        APIURL.apiKey +
        APIURL.pageUrl);
    // var response = await Dio().get(APIURL.baseApiUrl +
    //     BaseCategoryName.movie.getCategoryName() +
    //     MovieCategoryName.popular.getCategoryName() +
    //     APIURL.queryApiKeyValue +
    //     APIURL.apiKey +
    //     APIURL.pageUrl);

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(jsonEncode(response.data));
      final dataResults = data['results'];

      if (dataResults is List) {
        temp = dataResults.map((e) => MovieModel.fromJson(e)).toList();
      }
    }

    return temp;
  }
}
