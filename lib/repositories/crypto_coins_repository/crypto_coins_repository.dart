import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_currencies_app/repositories/repositories.dart';

class CryptoCoinsRepository implements AbstractrCoinsRepository {

  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final respons = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,SOL,CAG,DOV&tsyms=USD');
    debugPrint(respons.toString());

    final data = respons.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://cryptocompare.com$imageUrl',
      );
    }).toList();
    return cryptoCoinsList;
    // final creptoList = respons.entries
  }
}
