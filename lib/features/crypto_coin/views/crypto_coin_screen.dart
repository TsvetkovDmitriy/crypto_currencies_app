import 'dart:developer';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  // String coinName;

  const CryptoCoinScreen({super.key,
    // required this.coinName
  });

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert (args != null && args is String, 'You must provide String args');
    // if(args == null) {
    //   log('You must provide args');
    //   return;
    // }
    // if (args is! String) {
    //   log('You must provide String args');
    //   return;
    // }
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
