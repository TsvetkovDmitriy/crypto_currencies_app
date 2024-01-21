import 'package:crypto_currencies_app/repositories/crypto_coins_repository/abstract_coins_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../repositories/repositories.dart';

part 'crypto_list_event.dart';

part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoListEvent>((event, emit) async {
      try {
        emit(CryptoListLoadingState());
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoadedState(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailureState(e));
      }
    });
  }

  final AbstractrCoinsRepository coinsRepository;
}
