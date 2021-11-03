import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  ProductsModel product;
  CartModel cart;

  MyStore() {
    product = ProductsModel();
    cart = CartModel();
    cart.product = product;
  }
}
