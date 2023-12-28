import 'package:ecommerceapp/components/my_drawer.dart';
import 'package:ecommerceapp/components/product_tile.dart';
import 'package:ecommerceapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access the products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Fashion Shop",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //go to cart button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop subtitle
            Center(
                child: Text(
              "Choose from the best.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            )),

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  //get each individual product from shop
                  final product = products[index];

                  //return as product tile UI
                  return ProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
