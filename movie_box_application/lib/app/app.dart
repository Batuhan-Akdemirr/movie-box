import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/app/routes/navigator.dart';
import 'package:movie_box_application/app/themes/custom_theme_data.dart';
import 'package:movie_box_application/app/views/homepage/home_page.view.dart';
import 'package:movie_box_application/app/views/onboarding_view/onboarding.view.dart';
import 'package:movie_box_application/product/init/is_login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const String appName = 'Movie Box';
    return MaterialApp(
      title: appName,
      home:
          IsLogin.isLogin == 'false' ? const OnBoardingView() : const HomePage(),
      theme: CustomThemeData.darkTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigatorCustom.onGenerateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.deviceLocale,
    );
  }
}
