import 'package:flutter/material.dart';
import 'package:crypto_currencies_app/features/features.dart';


final routes = <String, WidgetBuilder>{
  '/crypto-list-screen' : (context) => const CryptoListScreen(),
  '/crypto-coin-screen' : (context) => const CryptoCoinScreen(
    // coinName: (ModalRoute.of(context)?.settings.arguments ?? '') as String,
  ),
};