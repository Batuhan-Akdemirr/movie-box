import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/app/app.dart';
import 'package:movie_box_application/product/init/product_init.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final productInit = ProductInit();
  await productInit.init();

  runApp(EasyLocalization(
      supportedLocales: productInit.localizationInit.supportedLocales,
      path: productInit.localizationInit.localizationPath,
      fallbackLocale: const Locale('tr', 'TR'),
      child: MultiProvider(
        providers: productInit.providers,
        builder: (context, child) => const App(),
      )));
}
