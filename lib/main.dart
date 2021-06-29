import 'dart:async';

import 'package:cook_cook/app/presentation/app.dart';
import 'package:cook_cook/core/services/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

late final Logger _logger;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();
  _logger = LoggerService().createLogger('App')..i('main');

  await runZonedGuarded(() async {
    Firebase.initializeApp();

    runApp(App());
  }, _onError);
}

Future<void> initServices() async {
  await LoggerService().init();
}

void _onError(Object error, StackTrace stack) {
  if (kDebugMode) {
    _logger.e('CRASH: ', error, stack);
    return;
  }
  // TODO creat crashliticks
}
