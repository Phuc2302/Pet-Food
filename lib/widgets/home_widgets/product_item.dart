import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/products.dart';

import 'add_to_cart.dart';

class ProductItem extends StatelessWidget {
  final Item product;
  const ProductItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 160.0,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                color: Colors.white24,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                // tag: "${product.id}",
                tag: Key(product.id.toString()),
                child: Image.network(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AddToCart(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
