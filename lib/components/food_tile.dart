import 'package:flutter/material.dart';
import 'package:quickbite/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key, 
    required this.food, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              // text food details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(
                          fontFamily: 'Poppins'
                        ),
                      ),
                      Text(
                        '₵${food.price}', 
                        style: TextStyle(
                          
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),  
              // food image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                food.imagePath, 
                height: 120,
                ),
              )
            ],
          ),
        ),

        // divider
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
