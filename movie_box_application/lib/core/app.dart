import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/routes/navigator.dart';
import 'package:movie_box_application/utils/themes/custom_theme_data.dart';
import 'package:movie_box_application/views/onboarding_view/onboarding.view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const String appName = 'Movie Box';
    return MaterialApp(
      title: appName,
      home: const OnBoardingView(),
      theme: CustomThemeData.darkTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigatorCustom.onGenerateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.deviceLocale,
    );
  }
}
