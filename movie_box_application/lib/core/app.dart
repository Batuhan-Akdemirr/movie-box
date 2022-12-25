import 'package:flutter/material.dart';
import 'package:movie_box_application/routes/navigator.dart';
import 'package:movie_box_application/views/onboarding_view/onboarding.view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Wtech Project',
        home: OnBoardingView(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigatorCustom.onGenerateRoute);
  }
}
