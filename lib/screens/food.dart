import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/button.dart';
import 'package:quickbite/models/food.dart';
import 'package:quickbite/models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      // food price
                      Text(
                        widget.food.price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 10),
                      // food description
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                            fontFamily: 'Poppins', fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(
                        'Add-ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      // addons
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              // get additional addons
                              Addon addon = widget.food.availableAddons[index];
                              // return check box UI
                              return CheckboxListTile(
                                  title: Text(
                                    addon.name,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins'),
                                  ),
                                  subtitle: Text(addon.price.toString()),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  });
                            }),
                      ),
                    ],
                  ),
                ),
                // button -> add to cart
                MyButton(
                    text: 'Add to cart',
                    onTap: () => addToCart(widget.food, widget.selectedAddons)),

                const SizedBox(height: 25)
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_rounded)),
            ),
          ),
        )
      ],
    );
  }
}
