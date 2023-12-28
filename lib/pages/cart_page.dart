import 'package:ecommerceapp/components/my_button.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  //remove item from cart
  void removeFromCart(BuildContext context, Product product) {
    //show a dialog box to ask the user to confirm to remove item cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              //pop
              Navigator.pop(context);

              //remove from cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User wants to pay! Connect this to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty!"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual items in cart
                      final item = cart[index];

                      // return as a cart tile ui
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => removeFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("Pay now")),
          )
        ],
      ),
    );
  }
}
