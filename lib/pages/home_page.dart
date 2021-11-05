import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/category.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/product_item.dart';
import 'package:flutter_catalog/widgets/slideshow.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // Future trì hoãn việc tải thông tin sản phẩm đến khi cần
    await Future.delayed(Duration(seconds: 2));
    // Lấy chuỗi json thô từ file products
    final productsJson =
        await rootBundle.loadString("assets/files/products.json");
    // Giải mã chuỗi json thô
    final decodeData = jsonDecode(productsJson);
    var productsData = decodeData["products"];
    ProductsModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromJon(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
          elevation: 0.0,
          title: !isSearching
              ? Text("Pet Food", style: TextStyle(color: Colors.black))
              : TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search..",
                      hintStyle: TextStyle(color: Colors.black))),
          centerTitle: true,
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                  )
          ]),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
        ).badge(
          color: Vx.red500,
          size: 22,
          count: _cart.items.length,
          textStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Categories(),
          Expanded(
            flex: 1,
            child: SlideShow(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: (ProductsModel.items != null &&
                      ProductsModel.items.isNotEmpty)
                  ? GridView.builder(
                      // Xác định lưới
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Số item trên 1 hàng ngang
                        // Khoảng cách giữa các hàng (các item trong cột dọc)
                        mainAxisSpacing: 16,
                        // Khoảng cách giữa các item trong hàng ngang
                        crossAxisSpacing: 16,
                      ),
                      itemCount: ProductsModel.items.length,
                      itemBuilder: (context, index) {
                        final product = ProductsModel.items[index];
                        // InkWell sử dụng để thêm hiệu ứng gợn sóng
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeDetailPage(product: product),
                            ),
                          ),
                          child: ProductItem(product: product),
                        );
                      })
                  : Center(
                      // Hiển thị hình tròn chỉ quá trình chờ đợi trong ứng dụng
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
