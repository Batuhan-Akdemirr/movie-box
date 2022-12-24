class APIURL {
  static const apiKey = '869797558bb737d8ebe434fa22ac5bb3';
  static const baseApiUrl = 'https://api.themoviedb.org/3/';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w300';
  static const queryApiKeyValue = '?api_key=';
  static const pageUrl = '&page=1';
  static const searchMovieDetailUrl = '&include_adult=false&query=';
}

enum BaseCategoryName { movie, search }

enum MovieCategoryName { upcoming, popular, similar }

