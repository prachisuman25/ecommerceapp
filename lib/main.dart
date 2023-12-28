import 'package:ecommerceapp/models/shop.dart';
import 'package:ecommerceapp/pages/cart_page.dart';
import 'package:ecommerceapp/pages/first_page.dart';
import 'package:ecommerceapp/pages/shop_page.dart';
import 'package:ecommerceapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      theme: lightMode,
      routes: {
        '/first_page':(context) => const FirstPage(),
        '/shop_page':(context) => const ShopPage(),
        '/cart_page' :(context) => const CartPage(),
      },
    );
  }
}