import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData flexLightTheme = FlexThemeData.light(
  scheme: FlexScheme.purpleM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  appBarOpacity: 0.00,
  appBarElevation: 9.0,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    filledButtonRadius: 11.0,
    elevatedButtonRadius: 8.0,
    inputDecoratorBackgroundAlpha: 115,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorRadius: 13.0,
    inputDecoratorUnfocusedBorderIsColored: false,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    snackBarRadius: 8,
    appBarBackgroundSchemeColor: SchemeColor.onSecondary,
    appBarScrolledUnderElevation: 9.5,
  ),
  keyColors: const FlexKeyColors(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.merriweather().fontFamily,
);

ThemeData flexDarkTheme = FlexThemeData.dark(
  scheme: FlexScheme.purpleM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  appBarElevation: 11.5,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    filledButtonRadius: 11.0,
    elevatedButtonRadius: 8.0,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorRadius: 13.0,
    inputDecoratorUnfocusedBorderIsColored: false,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    snackBarRadius: 8,
  ),
  keyColors: const FlexKeyColors(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.merriweather().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
