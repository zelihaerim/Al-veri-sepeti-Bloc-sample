// Cart = Sepet

import 'package:bloc_sample_1/models/product.dart';

class Cart{
  Product product;
  int quantity; // number of product in cart
  Cart(this.product,this.quantity);

}