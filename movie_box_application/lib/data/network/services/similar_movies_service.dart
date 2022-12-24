import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_box_application/models/movie_model.dart';
import 'package:movie_box_application/utils/constants/api_constants.dart';
import 'package:movie_box_application/utils/extensions/category_name_extension.dart';
import 'package:movie_box_application/utils/extensions/movie_category_name_extension.dart';


// İlgili filmle benzer filmleri API'den çeken servis sınıfı

class SimilarMoviesService {
   Future<List<MovieModel>> getMovies({id}) async {
    List<MovieModel> temp = [];
    var response = await Dio().get(APIURL.baseApiUrl +BaseCategoryName.movie.getCategoryName() +id.toString()+MovieCategoryName.similar.getCategoryName() + APIURL.queryApiKeyValue +  APIURL.apiKey);


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
