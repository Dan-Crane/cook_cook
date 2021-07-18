import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart' show DateFormat;
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LoggerService {
  factory LoggerService() => _instance ?? LoggerService._internal();
  static LoggerService? _instance = LoggerService._internal();
  LoggerService._internal() {
    _instance = this;
  }

  File? logFile;

  Logger createLogger(String className) =>
      _loggerCreator?.call(className) ?? Logger(level: Level.nothing);
  Logger Function(String className)? _loggerCreator;
  Logger? _logger;

  final prettyPrinter = PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 10,
    lineLength: 80,
    colors: false,
  );

  Future<void> init() async {
    final directory = await getLogsDir();
    final format = DateFormat('yyyy-MM-dd').format(DateTime.now());
    logFile = File('${directory.path}/$format.log');

    if (kDebugMode) {
      await _initDebug();
    } else {
      await _initRelease();
    }
  }

  Future<void> _initDebug() async {
    Logger.level = Level.verbose;
    _loggerCreator = (String className) {
      return Logger(printer: ClassNamePrinter(prettyPrinter, className));
    };
    _logger = _loggerCreator?.call('LoggerService')?..i('initDebug');
  }

  // TODO create log to crashlytics
  Future<void> _initRelease() async {}

  Future<Directory> getLogsDir() async {
    final directory = await getApplicationSupportDirectory();
    final logsDir = Directory('${directory.path}/logs');
    await logsDir.create(recursive: true);
    return logsDir;
  }

  Future<Directory?> clearLogsDir() async {
    _logger?.i('clearLogsDir');

    try {
      final logsDir = await getLogsDir();
      await logsDir.delete(recursive: true);
      await logsDir.create(recursive: true);
    } catch (e, stack) {
      _logger?.e('clearLogsDir failed', e, stack);
    }
  }
}

class ClassNamePrinter extends LogPrinter {
  final LogPrinter _realPrinter;
  final String _className;

  ClassNamePrinter(this._realPrinter, this._className);

  @override
  List<String> log(LogEvent event) {
    final realLogs = _realPrinter.log(event);
    return realLogs.map((s) => '$_className: $s').toList();
  }
}
