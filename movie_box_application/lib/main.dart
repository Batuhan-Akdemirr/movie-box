import 'package:flutter/material.dart';
import 'package:movie_box_application/core/app.dart';
import 'package:movie_box_application/data/local/shared_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.initSharedPreferences();
  runApp(const App());
}
