import 'package:cook_cook/app/app_theme_date.dart';
import 'package:flutter/widgets.dart';

class AppTheme extends StatefulWidget {
  final Widget child;
  final AppThemeData appThemeData;

  AppTheme({
    required this.child,
    required this.appThemeData,
    Key? key,
  }) : super(key: key);

  @override
  _AppThemeState createState() => _AppThemeState();

  static _AppThemeState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedAppTheme>()
        ?.data;
  }
}

class _AppThemeState extends State<AppTheme> {
  AppThemeData get appThemeData => widget.appThemeData;

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(
      key: widget.key,
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedAppTheme extends InheritedWidget {
  final _AppThemeState data;
  final Widget child;

  _InheritedAppTheme({
    required this.data,
    required this.child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme oldWidget) {
    return true;
  }
}
