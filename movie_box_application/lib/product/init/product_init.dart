import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/core/data/local/shared_manager.dart';
import 'package:movie_box_application/product/init/localization_init.dart';
import 'package:movie_box_application/product/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<OnBoardingProvider>(
      create: (context) => OnBoardingProvider(),
    )
  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter('application');
    await Hive.openBox('movies');
    await SharedManager.initSharedPreferences();
    await EasyLocalization.ensureInitialized();
  }
}
