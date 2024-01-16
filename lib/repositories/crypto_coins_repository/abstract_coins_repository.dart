import 'package:crypto_currencies_app/repositories/repositories.dart';

abstract class AbstractrCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}