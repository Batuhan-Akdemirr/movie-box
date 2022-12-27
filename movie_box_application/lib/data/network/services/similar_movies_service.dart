import 'package:movie_box_application/data/network/services/service_library.dart';

class SimilarMoviesService {
  Future<List<MovieModel>> getMovies({id}) async {
    List<MovieModel> temp = [];

    var response = await NetworkManager.instance.dio.get(APIURL.baseApiUrl +
        BaseCategoryName.movie.getCategoryName() +
        id.toString() +
        MovieCategoryName.similar.getCategoryName() +
        APIURL.queryApiKeyValue +
        APIURL.apiKey +
        APIURL.language +
        InitLocaleLanguage.instance.localeLanguage);

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
