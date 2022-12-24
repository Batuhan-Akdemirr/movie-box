import 'package:movie_box_application/utils/constants/api_constants.dart';

extension CategoryNameException on BaseCategoryName {
  String getCategoryName() {
    switch (this) {
      case BaseCategoryName.movie:
        return BaseCategoryName.movie.name;

      case BaseCategoryName.search:
        return BaseCategoryName.search.name;
    }
  }
}
