import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  ProductsModel _product;

  // Id của từng sản phẩm (Collection of Id)
  final List<int> _itemsId = [];

  // Get product
  ProductsModel get product => _product;

  set product(ProductsModel newProduct) {
    assert(newProduct != null);
    _product = newProduct;
  }

  // Get items in the cart
  List<Item> get items => _itemsId.map((id) => _product.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemsId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemsId.remove(item.id);
  }
}
