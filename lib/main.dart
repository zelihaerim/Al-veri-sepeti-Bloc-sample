import 'package:bloc_sample_1/screens/cart_screen.dart';
import 'package:bloc_sample_1/screens/product_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // asagidaki route ler named routelerdir.
        "/": (BuildContext context) =>
            ProductListScreen(), // anasayfa istegi gelirse,
        "/cart": (BuildContext context) => CartScreen()
      },
      initialRoute: "/",
    );
  }
}
