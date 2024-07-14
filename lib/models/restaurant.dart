import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickbite/models/cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: 'Bacon Burger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/bacon.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Classic Burger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/burger.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Beef Burger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/beef-burger.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Cheeseburger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/cheese.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Vegie Burger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/vegie-burger.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    // salads
    Food(
      name: 'Fruit Salad',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/chicken.jpg ',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    // drinks
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/cheese.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    // desserts
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/cake.jpg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    // sides
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/fries.jpg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    // drinks
    Food(
      name: 'Coca-Cola',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/drink_1.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Fanta',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/drink_2.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Sprite',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/drink_3.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Pepsi Zero-Sugar',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/drink_4.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
    Food(
      name: 'Sparkled Water',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/food/drink_5.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ]
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address
  String _deliveryAddress = '99 Hollywood Blv';

  /*

  G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

 O P E R A T I O N S

  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

  H E L P E R S

  */

  // generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('-----------');

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return '₵${price.toStringAsFixed(2)}';
  }

  // format a list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name}  (${_formatPrice(addon.price)})')
        .join(', ');
  }

  //
}
