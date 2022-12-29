import 'package:flutter/material.dart';

class BaseMovieCard extends StatelessWidget {
  const BaseMovieCard({Key? key, required this.myWidget}) : super(key: key);
  final Widget myWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: myWidget,
    );
  }
}
