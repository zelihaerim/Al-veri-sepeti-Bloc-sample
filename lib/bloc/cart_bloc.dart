import 'dart:async';

import 'package:bloc_sample_1/data/cart_service.dart';
import 'package:bloc_sample_1/models/cart.dart';

class CartBloc {
  // bi tane stream controller objesi urettik
  final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item) {
    CartService.addToCart(item);
    // Sinke e bir event ekledik (Bu event i kullanan yerlerin buil operasyonlarini bir daha calistir)
    // ve aslinda stream e haber veriyor getcard i kimler kullaniyorsa onlar icin
    // gerekli buildi tekrar calistir ve ilgili yerleri guncelle
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
