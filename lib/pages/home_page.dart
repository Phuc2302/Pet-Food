import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/product_item.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final productsJson =
        await rootBundle.loadString("assets/files/products.json");
    final decodeData = jsonDecode(productsJson);
    var productsData = decodeData["products"];
    ProductsModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromJon(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Pet Food"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (ProductsModel.items != null && ProductsModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: ProductsModel.items.length,
                itemBuilder: (context, index) {
                  final product = ProductsModel.items[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailPage(product: product),
                      ),
                    ),
                    child: ProductItem(product: product),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}


// ListView.builder(
//  itemCount: ProductsModel.items.length,
//  itemBuilder: (context, index) {
//    return ItemWidget(
//      item: ProductsModel.items[index],
//    );
//  },
//)

// Card(
//   clipBehavior: Clip.antiAlias,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10),
//   ),
//   child: GridTile(
//     header: Container(
//       child: Text(
//         item.name,
//         style: TextStyle(color: Colors.white),
//       ),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.deepPurple,
//       ),
//     ),
//     child: Image.network(
//       item.image,
//     ),
//     footer: Container(
//       child: Text(
//         item.price.toString(),
//         style: TextStyle(color: Colors.white),
//       ),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.black54,
//       ),
//     ),
//   ),
// );