import 'package:movie_box_application/core/data/network/services/service_library.dart';

class UpcomingMoviesService implements IMoviesService {
  @override
  Future<List<MovieModel>> getMovies({String? movieName, int? id}) async {
    List<MovieModel> temp = [];

    var response = await NetworkManager.instance.dio.get(APIURL.baseApiUrl +
        BaseCategoryName.movie.getCategoryName() +
        MovieCategoryName.upcoming.getCategoryName() +
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
