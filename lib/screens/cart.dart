import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/button.dart';
import 'package:quickbite/components/cart_tile.dart';
import 'package:quickbite/models/restaurant.dart';
import 'package:quickbite/screens/payment_page.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'Poppins'
            ),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text(
                      'Are you sure you want to clear the cart?',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontFamily: 'Poppins'),
                        )
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(fontFamily: 'Poppins'),
                        )
                      ),
                    ],
                  )
                );
              },
              icon: const Icon(Icons.delete)
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty 
                    ? const Expanded(
                        child: Center(
                          child: Text(
                            'Cart is empty...',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          )
                        )
                      ) 
                    : Expanded(
                  child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = userCart[index];
              
                        return MyCartTile(cartItem: cartItem);
                      }
                    )
                  )
                ],
              ),
            ),

            MyButton(
              text: 'Go to checkout', 
              onTap: () => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const PaymentPage()
                )
              )
            ),
            const SizedBox(height: 25)
          ],
        ),
      );
    });
  }
}
