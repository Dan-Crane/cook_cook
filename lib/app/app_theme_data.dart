import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeData {
  final ThemeData themeData;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color accentMediumColor;
  final Color accentLightColor;
  final Color disabledColor;
  final Color errorColor;
  final Color separatorColor;
  final Color overlayColor;
  final Color highlightColor;
  final Color secondHighlightColor;

  static const FONT_FAMILY = 'CeraPro';
  static const FONT_FAMILY_ACCENT = 'Kurale';
  static const baseSize = 8.0;
  final inputPadding = const EdgeInsets.symmetric(
    horizontal: baseSize * 2,
    vertical: baseSize * 1.375,
  );
  final buttonPadding = const EdgeInsets.symmetric(horizontal: baseSize * 4.5);
  final int plateBackgroundAlpha = 50;
  final double searchBarHeight = 36;
  final double avatarRadius = 17;
  final double mainPadding = 16;
  final double halfPadding = 8;
  final double borderRadius = 8;
  final double inputHeight = 48;

  const AppThemeData({
    required this.themeData,
    required this.systemUiOverlayStyle,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.accentMediumColor,
    required this.accentLightColor,
    required this.disabledColor,
    required this.errorColor,
    required this.separatorColor,
    required this.overlayColor,
    required this.highlightColor,
    required this.secondHighlightColor,
  });

  factory AppThemeData.light() {
    final primaryColor = Color(0xFF000000);
    final secondaryColor = Color(0xFF636773);

    final accentColor = Color(0xFFFF8527);
    final accentMediumColor = Color(0xFFFFB945);
    final accentLightColor = Color(0xFFB3B4BA);
    final disabledColor = Color(0xFFE1E2E3);
    final errorColor = Color(0xFFFF6347);

    final separatorColor = Color(0xffE6E4EA);
    final overlayColor = Color.fromRGBO(0, 0, 0, 0.16);
    final highlightColor = Color(0xffececee);
    final blueHighlightColor = Color(0xA585CAE4);

    final fontSize28 = baseSize * 3.5;
    final fontSize20 = baseSize * 2.5;
    final fontSize18 = baseSize * 2.25;
    final fontSize17 = baseSize * 2.125;
    final fontSize15 = baseSize * 1.875;
    final fontSize14 = baseSize * 1.75;
    final fontSize12 = baseSize * 1.5;
    final fontSize10 = baseSize * 1.25;

    final ineHeight42 = baseSize * 5.25;
    final ineHeight30 = baseSize * 3.75;
    final ineHeight28 = baseSize * 3.5;
    final ineHeight26 = baseSize * 3.25;
    final ineHeight22 = baseSize * 2.75;
    final ineHeight20 = baseSize * 2.5;
    final ineHeight16 = baseSize * 2;
    final ineHeight14 = baseSize * 1.75;

    final semiBold = FontWeight.w600;
    final medium = FontWeight.w500;
    final regular = FontWeight.w400;

    final textTheme = TextTheme(
      headline1: TextStyle(
        fontSize: fontSize28,
        height: ineHeight42 / fontSize28,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      headline2: TextStyle(
        fontSize: fontSize20,
        height: ineHeight30 / fontSize20,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      headline3: TextStyle(
        fontSize: fontSize18,
        height: ineHeight28 / fontSize18,
        fontWeight: medium,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      // MARK headline4 such as headline3 with uppercase
      headline5: TextStyle(
        fontSize: fontSize18,
        height: ineHeight28 / fontSize18,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      headline6: TextStyle(
        fontSize: fontSize17,
        height: ineHeight26 / fontSize17,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      subtitle1: TextStyle(
        fontSize: fontSize18,
        height: ineHeight28 / fontSize18,
        fontWeight: medium,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      subtitle2: TextStyle(
        fontSize: fontSize14,
        height: ineHeight20 / fontSize14,
        fontWeight: semiBold,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      bodyText1: TextStyle(
        fontSize: fontSize15,
        height: ineHeight22 / fontSize15,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      bodyText2: TextStyle(
        fontSize: fontSize14,
        height: ineHeight20 / fontSize14,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      button: TextStyle(
        fontSize: fontSize17,
        height: ineHeight26 / fontSize17,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      caption: TextStyle(
        fontSize: fontSize12,
        height: ineHeight16 / fontSize12,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
      overline: TextStyle(
        fontSize: fontSize10,
        height: ineHeight14 / fontSize10,
        fontWeight: regular,
        fontFamily: FONT_FAMILY,
        color: primaryColor,
      ),
    );

    final themeData = ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColor,
      primaryColorLight: Color(0xFFFFFFFF),
      accentColor: accentColor,
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
      splashColor: Colors.transparent,
      highlightColor: highlightColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      canvasColor: Color(0xFFFFFFFF), //Drawer
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: primaryColor,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: textTheme.button?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentTextStyle: textTheme.bodyText2?.copyWith(
          color: secondaryColor,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: secondaryColor,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      toggleableActiveColor: accentColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFFFFFF),
      ),
      buttonTheme: ButtonThemeData(),
      appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: primaryColor),
        iconTheme: IconThemeData(color: primaryColor),
        textTheme: textTheme.copyWith(
          headline6: textTheme.headline2?.copyWith(height: 1),
        ),
        color: Color(0xFFFFFFFF),
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: false,
      ),
      dividerTheme: DividerThemeData(
        color: Color(0xffE6E4EA),
        thickness: 1,
        endIndent: 0,
        indent: 0,
        space: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: accentColor,
        errorMaxLines: 2,
        hintStyle: textTheme.headline6?.copyWith(
          color: accentLightColor,
          height: 1,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: accentColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: separatorColor),
        ),
        errorStyle: textTheme.caption?.copyWith(color: errorColor, height: 1),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: errorColor),
        ),
        contentPadding: EdgeInsets.only(bottom: 8),
      ),
      fontFamily: FONT_FAMILY,
      textTheme: textTheme,
    );

    return AppThemeData(
      themeData: themeData,
      systemUiOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color(0xFFFFFFFF),
      ),
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      accentColor: accentColor,
      accentMediumColor: accentMediumColor,
      accentLightColor: accentLightColor,
      disabledColor: disabledColor,
      errorColor: errorColor,
      separatorColor: separatorColor,
      overlayColor: overlayColor,
      highlightColor: highlightColor,
      secondHighlightColor: blueHighlightColor,
    );
  }
}
