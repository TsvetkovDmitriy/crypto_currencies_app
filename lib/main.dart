import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_currencies_app/themes/crypto_currencies_app_theme.dart';
import 'package:crypto_currencies_app/router/routes.dart';
import 'repositories/repositories.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractrCoinsRepository>(() => CryptoCoinsRepository(dio: Dio()));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CryptoCurrenciesAppTheme.darkTheme,
      routes: routes,
      initialRoute: '/crypto-list-screen',
    ),
  );
}
