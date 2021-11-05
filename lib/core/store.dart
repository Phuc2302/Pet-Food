import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

// VxStore lưu trữ tất cả dữ liệu trong bộ nhớ của ứng dụng, các thay đổi dữ
// liệu từ API, DB...
// Giống như Redux nó sẽ cho phép chúng ta quản lý state trong ứng dụng.
class MyStore extends VxStore {
  ProductsModel product;
  CartModel cart;

  MyStore() {
    product = ProductsModel();
    cart = CartModel();
    cart.product = product;
  }
}
