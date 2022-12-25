

import 'package:movie_box_application/data/network/services/service_library.dart';

class MoviesDetailService implements IMoviesService {
  final MovieDetailsModel _movieDetail = MovieDetailsModel();
  @override
  Future<MovieDetailsModel?> getMovies({String? movieName, int? id}) async {
    var response = await NetworkManager.instance.dio.get(APIURL.baseApiUrl +
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
