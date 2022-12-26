import 'package:flutter/material.dart';
import 'package:movie_box_application/core/app.dart';
import 'package:movie_box_application/data/local/shared_manager.dart';
import 'package:movie_box_application/product/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.initSharedPreferences();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<OnBoardingProvider>(
        create: (context) => OnBoardingProvider(),
      )
    ],
    builder: (context, child) => const App(),
  ));
}

