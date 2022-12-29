import 'package:movie_box_application/core/utils/constants/api_constants.dart';

extension MovieCategoryNameExtension on MovieCategoryName {
  String getCategoryName() {
    switch (this) {
      case MovieCategoryName.upcoming:
        return MovieCategoryName.upcoming.name;
      case MovieCategoryName.popular:
        return MovieCategoryName.popular.name;
      case MovieCategoryName.similar:
        return '/'+MovieCategoryName.similar.name;
    }
  }
}
