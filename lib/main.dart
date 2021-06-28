import 'package:cook_cook/app/presentation/app.dart';
import 'package:cook_cook/core/services/logger.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LoggerService().init();
  runApp(App());
}
