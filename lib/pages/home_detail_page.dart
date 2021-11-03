import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item product;
  const HomeDetailPage({Key key, @required this.product})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.all(32.0),
          children: [
            Text(
              "\$ ${product.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.red[900],
              ),
            ),
            Container(
              width: 120,
              height: 50,
              child: AddToCart(product: product),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Container(
                width: 250.0,
                // padding: const EdgeInsets.all(16.0),
                padding: EdgeInsets.only(bottom: 16.0),
                child: Hero(
                  tag: Key(product.id.toString()),
                  child: Image.network(product.image),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          // "Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae architecto deleniti unde. Porro ex blanditiis accusamus earum placeat modi? Ipsa nihil inventore magni iure temporibus, deserunt modi corporis doloremque dolor.",
                          product.desc,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ElevatedButton(
//                 onPressed: () {},
//                 child: Text("Add to cart"),
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.black87),
//                   shape: MaterialStateProperty.all(
//                     StadiumBorder(),
//                   ),
//                 ),
//               ),