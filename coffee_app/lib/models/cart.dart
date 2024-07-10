import 'package:coffee_app/models/coffee.dart';

class Cart {
  List<Coffee> coffeeShop = [
    Coffee(
      name: 'Dark Coffee',
      price: '3.50\$',
      imagePath: 'lib/images/cup-of-coffee.png',
    ),
    Coffee(
      name: 'Cappuccino',
      price: '3.15\$',
      imagePath: 'lib/images/cappuccino.png',
    ),
    Coffee(
      name: 'Iced Coffee',
      price: '3.50\$',
      imagePath: 'lib/images/iced-coffee.png',
    ),
    Coffee(
      name: 'Latte',
      price: '3.75\$',
      imagePath: 'lib/images/latte.png',
    ),
  ];

  List<Coffee> userCart = [];

  List<Coffee> getCoffeeList() {
    return coffeeShop;
  }

  List<Coffee> getUserCart() {
    return userCart;
  }

  void removeItemFromCart(Coffee coffee) {
    userCart.remove(coffee);
  }
}
