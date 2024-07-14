import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/quantity_selector.dart';
import 'package:quickbite/models/cart_item.dart';
import 'package:quickbite/models/restaurant.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.food.name,
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                      Text(
                        '\$${cartItem.food.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  QuantitySelector(
                    food: cartItem.food,
                    quantity: cartItem.quantity,
                    onIncrement: () {
                      restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                    },
                    onDecrement: () {
                       restaurant.removeFromCart(cartItem);
                    }
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                children: cartItem.selectedAddons
                .map(
                  (addon) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Row(
                        children: [
                          Text(addon.name),
                          Text(' (\$${addon.price})')
                        ],
                      ), 
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                      onSelected: (value) {},
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontFamily: 'Poppins',
                        fontSize: 12
                      ),
                    ),
                  )
                ).toList(),
              ),
            )
          ],
        ),
      )
    );
  }
}
