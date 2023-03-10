import 'package:movie_box_application/core/data/network/services/service_library.dart';

class MoviesDetailService implements IMoviesService {
  final MovieDetailModel _movieDetail = MovieDetailModel();
  @override
  Future<MovieDetailModel?> getMovies({String? movieName, int? id}) async {
    var response = await NetworkManager.instance.dio.get(APIURL.baseApiUrl +
        BaseCategoryName.movie.getCategoryName() +
        id.toString() +
        APIURL.queryApiKeyValue +
        APIURL.apiKey +
        APIURL.language +
        InitLocaleLanguage.instance.localeLanguage);

    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;

      if (data is Map<String, dynamic>) {
        return MovieDetailModel.fromJson(data);
      }

      return _movieDetail;
    }
    return null;
  }
}
