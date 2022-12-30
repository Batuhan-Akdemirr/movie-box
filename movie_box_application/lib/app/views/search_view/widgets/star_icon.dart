import 'package:flutter/material.dart';
import 'package:movie_box_application/core/utils/constants/color_constants.dart';

class StarIcon extends StatelessWidget {
  final IconData icon;

  const StarIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: ColorConstants.starColor);
  }
}
