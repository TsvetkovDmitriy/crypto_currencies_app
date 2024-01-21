import 'package:flutter/material.dart';

class CryptoCurrenciesAppTheme {
  static final ThemeData darkTheme = ThemeData(
      // primaryColor: Colors.yellow,
      // focusColor: Colors.yellow,
      // primaryColorDark: Colors.yellow,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          // textStyle: const TextStyle(color: Colors.yellow),
          primary: Colors.yellow.shade700
        )
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
      dividerColor: Colors.white24,
      textTheme: TextTheme(
        bodyMedium: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700),
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)),
      listTileTheme: const ListTileThemeData(iconColor: Colors.white)
      // iconTheme: const IconThemeData(color: Colors.white)
      );
}
