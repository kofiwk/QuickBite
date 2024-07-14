import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/models/restaurant.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'Your Location',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              content: const TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Address..',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    String newAddress = textController.text;
                    context
                      .read<Restaurant>()
                      .updateDeliveryAddress(newAddress);
                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'Poppins'),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
