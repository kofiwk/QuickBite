import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/receipt.dart';
import 'package:quickbite/models/restaurant.dart';
import 'package:quickbite/services/auth/firestore.dart';

class DeliveryProgress extends StatefulWidget {
  const DeliveryProgress({super.key});

  @override
  State<DeliveryProgress> createState() => _DeliveryProgressState();
}

class _DeliveryProgressState extends State<DeliveryProgress> {
  FirestoreService db = FirestoreService();
  @override
  void initState() {
    super.initState();

    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [MyReceipt()],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'William Kukah',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              Text(
                'Driver',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 14),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
