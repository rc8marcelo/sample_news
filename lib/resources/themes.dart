import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      tabBarTheme: _tabTheme,
      textTheme: _textTheme,
    );

ThemeData get darkTheme => ThemeData(
      colorScheme: _darkColorScheme,
      useMaterial3: true,
      tabBarTheme: _tabTheme,
      textTheme: _textTheme,
    );

final _textTheme = TextTheme(
  displayLarge: _trirongStyle.bold,
  displayMedium: _trirongStyle.bold,
  displaySmall: _trirongStyle.medium,
  headlineLarge: _trirongStyle.bold,
  headlineMedium: _trirongStyle.semibold,
  headlineSmall: _trirongStyle.medium,
  titleLarge: _trirongStyle.bold,
  titleMedium: _trirongStyle.semibold,
  titleSmall: _trirongStyle.medium,
  bodyLarge: _workSansStyle,
  bodyMedium: _workSansStyle,
  bodySmall: _workSansStyle,
  labelLarge: _workSansStyle.semibold,
  labelMedium: _workSansStyle.medium,
  labelSmall: _workSansStyle,
);

final _tabTheme = TabBarTheme(
  indicator: const BoxDecoration(),
  dividerColor: Colors.transparent,
  labelPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
  overlayColor: MaterialStateProperty.all(Colors.transparent),
);

const _trirongStyle = TextStyle(
  fontFamily: 'Trirong',
  fontWeight: FontWeight.normal,
);

const _workSansStyle = TextStyle(
  fontFamily: 'WorkSans',
  fontWeight: FontWeight.normal,
);

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF00668A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFC3E8FF),
  onPrimaryContainer: Color(0xFF001E2C),
  secondary: Color(0xFF4D57A9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDFE0FF),
  onSecondaryContainer: Color(0xFF000A64),
  tertiary: Color(0xFF815600),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDDB1),
  onTertiaryContainer: Color(0xFF291800),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFCFF),
  onBackground: Color(0xFF191C1E),
  surface: Color(0xFFFBFCFF),
  onSurface: Color(0xFF191C1E),
  surfaceVariant: Color(0xFFDCE3E9),
  onSurfaceVariant: Color(0xFF41484D),
  outline: Color(0xFF71787D),
  onInverseSurface: Color(0xFFF0F1F3),
  inverseSurface: Color(0xFF2E3133),
  inversePrimary: Color(0xFF7AD0FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF00668A),
  outlineVariant: Color(0xFFC0C7CD),
  scrim: Color(0xFF000000),
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF7AD0FF),
  onPrimary: Color(0xFF003549),
  primaryContainer: Color(0xFF004C68),
  onPrimaryContainer: Color(0xFFC3E8FF),
  secondary: Color(0xFFBDC2FF),
  onSecondary: Color(0xFF1C2678),
  secondaryContainer: Color(0xFF353E90),
  onSecondaryContainer: Color(0xFFDFE0FF),
  tertiary: Color(0xFFFFBA49),
  onTertiary: Color(0xFF442B00),
  tertiaryContainer: Color(0xFF624000),
  onTertiaryContainer: Color(0xFFFFDDB1),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1E),
  onBackground: Color(0xFFE1E2E5),
  surface: Color(0xFF191C1E),
  onSurface: Color(0xFFE1E2E5),
  surfaceVariant: Color(0xFF41484D),
  onSurfaceVariant: Color(0xFFC0C7CD),
  outline: Color(0xFF8A9297),
  onInverseSurface: Color(0xFF191C1E),
  inverseSurface: Color(0xFFE1E2E5),
  inversePrimary: Color(0xFF00668A),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF7AD0FF),
  outlineVariant: Color(0xFF41484D),
  scrim: Color(0xFF000000),
);

extension TextStyleX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
