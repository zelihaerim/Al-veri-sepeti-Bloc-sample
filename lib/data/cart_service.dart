import 'package:bloc_sample_1/models/cart.dart';

class CartService {
  static List<Cart> cartItems = new List<Cart>();

  static CartService _singleton = CartService._internal();
  factory CartService() {
    return _singleton;
  }
  CartService._internal(); // internal isimli named constructor

  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static CartService getCartService() {
    if (_singleton == null) {
      _singleton = CartService._internal();
    }
    return _singleton;
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
