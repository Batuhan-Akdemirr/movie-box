import 'package:flutter/material.dart';
import 'package:movie_box_application/views/temp.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wtech Project',
      home: Temp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
