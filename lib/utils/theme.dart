import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherTheme {
  static TextTheme weatherTextTheme = TextTheme(
    headline1: GoogleFonts.spaceGrotesk(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    headline2: GoogleFonts.spaceGrotesk(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryTextColor
    ),
    headline3: GoogleFonts.spaceGrotesk(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor
    ),
    
  );

  static ThemeData weatherTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ThemeData(
      textTheme: weatherTextTheme,
    );
  }
}
