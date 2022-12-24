import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_box_application/data/network/abstractions/movies_service.dart';
import 'package:movie_box_application/models/movie_model.dart';
import 'package:movie_box_application/utils/constants/api_constants.dart';
import 'package:movie_box_application/utils/extensions/category_name_extension.dart';

// İsmi girilen filmlerin bilgilerini API'den getiren servis sınıfı

class SearchMoviesService implements IMoviesService {
  @override
  Future<List<MovieModel>> getMovies({String? movieName, int? id}) async {
    List<MovieModel> temp = [];

    var response = await Dio().get(
        '${APIURL.baseApiUrl}${BaseCategoryName.search.getCategoryName()}movie${APIURL.queryApiKeyValue}${APIURL.apiKey}${APIURL.searchMovieDetailUrl}${movieName!}');

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
