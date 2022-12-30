import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/search_view/widgets/star_icon.dart';

class StarCalculate {
  static List<Widget> getStars({required double? rating}) {
    List<StarIcon> temp = [];
    if (rating != null) {
      for (var i = 0; i < rating ~/ 2; i++) {
        temp.add(const StarIcon(
          icon: Icons.star,
        ));
      }

      if (rating > 0 && rating % 2 != 0) {
        temp.add(const StarIcon(
          icon: Icons.star_half,
        ));
      }

      while (temp.length < 5) {
        temp.add(const StarIcon(
          icon: Icons.star_border,
        ));
      }
    }
    return temp;
  }
}
