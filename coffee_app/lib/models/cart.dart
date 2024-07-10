import 'package:coffee_app/models/product.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Product> coffees = [
    Product(
      name: 'Dark Coffee',
      price: '3.50',
      imagePath: 'lib/images/coffee/cup-of-coffee.png',
    ),
    Product(
      name: 'Cappuccino',
      price: '3.15',
      imagePath: 'lib/images/coffee/cappuccino.png',
    ),
    Product(
      name: 'Iced Coffee',
      price: '3.50',
      imagePath: 'lib/images/coffee/iced-coffee.png',
    ),
    Product(
      name: 'Latte',
      price: '3.75',
      imagePath: 'lib/images/coffee/latte.png',
    ),
  ];

  List<Product> teas = [
    Product(
      name: 'Bubble Tea',
      price: '4.25',
      imagePath: 'lib/images/tea/bubble-tea.png',
    ),
    Product(
      name: 'Green Tea',
      price: '2.00',
      imagePath: 'lib/images/tea/green-tea.png',
    ),
    Product(
      name: 'Lemon Tea',
      price: '1.50',
      imagePath: 'lib/images/tea/lemon-tea.png',
    ),
    Product(
      name: 'Jasmine Tea',
      price: '1.75',
      imagePath: 'lib/images/tea/tea-cup.png',
    ),
  ];

  List<Product> cakes = [
    Product(
      name: 'Brownie',
      price: '1.75',
      imagePath: 'lib/images/cake/brownie.png',
    ),
    Product(
      name: 'Chocolate Cake',
      price: '2.75',
      imagePath: 'lib/images/cake/cake.png',
    ),
    Product(
      name: 'Cheese Cake',
      price: '2.75',
      imagePath: 'lib/images/cake/cheesecake.png',
    ),
    Product(
      name: 'Cupcake',
      price: '1.75',
      imagePath: 'lib/images/cake/cupcake.png',
    ),
  ];

  List<Product> userCart = [];

  List<Product> getCoffeeList() {
    return coffees;
  }

  List<Product> getTeaList() {
    return teas;
  }

  List<Product> getCakeList() {
    return cakes;
  }

  List<Product> getUserCart() {
    return userCart;
  }

  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }

  void removeAllItemFromCart() {
    userCart.clear();
    notifyListeners();
  }
}
