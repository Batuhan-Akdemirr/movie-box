import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/homepage/widgets/home_page_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: HomePageAppBar());
  }
}
