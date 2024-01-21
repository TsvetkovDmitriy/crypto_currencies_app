part of 'crypto_list_bloc.dart';

@immutable
abstract class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoadingState extends CryptoListState {}

class CryptoListLoadedState extends CryptoListState {
  CryptoListLoadedState({required this.coinsList});

  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingFailureState extends CryptoListState {
  CryptoListLoadingFailureState(this.exception);

  final Object? exception;
}