import 'package:flutter/material.dart';
import 'package:crypto_currencies_app/repositories/repositories.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      // contentPadding: const EdgeInsets.all(0),
      // titleAlignment: ListTileTitleAlignment.top,
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${(coin.priceInUSD*10000).round()/10000} \$',
        style: theme.textTheme.bodySmall,
      ),
      trailing: const Icon(
        Icons.navigate_next,
        size: 30,
      ),
      onTap: () => Navigator.pushNamed(
        context,
        '/crypto-coin-screen',
        arguments: coin.name,
      ),
    );
  }
}
