import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Expanded(
              child: _CartList(),
            ),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _) {
              return Text(
                "\$ ${_cart.totalPrice}",
                style: TextStyle(fontSize: 26, color: Colors.redAccent),
              );
            },
          ),
          Container(
            width: 140,
            child: ElevatedButton(
              onPressed: () {
                // Hiển thị một snackBar khi hoàn thành một action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Buying not supported yet."),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkCreamColor),
              ),
              child: Text("Buy"),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? Center(
            child: Text(
              "Empty Cart",
              style: TextStyle(fontSize: 24),
            ),
          )
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.grey[300]),
                            ),
                            child: Center(
                              child: Container(
                                height: 60.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    image: NetworkImage(
                                        "${_cart.items[index].image}"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: 200.0,
                                  child: Text(
                                    _cart.items[index].name,
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\$ ${_cart.items[index].price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      // Spacer tạo ra 1 khoảng trống để điều chỉnh khoảng cách giữa các Widget con
                                      Spacer(),
                                      IconButton(
                                        onPressed: () =>
                                            RemoveMutation(_cart.items[index]),
                                        icon: Icon(Icons
                                            .remove_circle_outline_outlined),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
