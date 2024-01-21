import 'package:crypto_currencies_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:crypto_currencies_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_currencies_app/repositories/repositories.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  final _cryptoListBloc = CryptoListBloc(
    GetIt.instance<AbstractrCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoListEvent());
    // _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('CryptoCurrenciesList '),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoListBloc.add(LoadCryptoListEvent());
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoadedState) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => Divider(
                  color: theme.dividerColor,
                ),
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }
            if (state is CryptoListLoadingFailureState) {
              return Center(
                // child: Text(state.exception?.toString() ?? 'Exception'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      'please try again later',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(onPressed: () {
                      _cryptoListBloc.add(LoadCryptoListEvent());
                    }, child: const Text('Try again'))
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      // (_cryptoCoinsList == null)
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.separated(
      //         padding: const EdgeInsets.only(top: 16),
      //         itemCount: _cryptoCoinsList!.length,
      //         separatorBuilder: (context, index) => Divider(
      //           color: theme.dividerColor,
      //         ),
      //         itemBuilder: (context, i) {
      //           final coin = _cryptoCoinsList![i];
      //           return CryptoCoinTile(coin: coin);
      //         },
      //       ),
    );
  }

// Future<void> _loadCryptoCoins() async {
//   _cryptoCoinsList =
//       await GetIt.instance<AbstractrCoinsRepository>().getCoinsList();
//   setState(() {});
// }
}
