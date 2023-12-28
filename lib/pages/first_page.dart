import 'package:ecommerceapp/components/my_button.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),

            //title
            const Text(
              'S H O P',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(
              height: 10,
            ),
            //subtitle
            Text(
              ' Style! Quality!  Discount! ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(
              height: 10,
            ),

            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
             child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
