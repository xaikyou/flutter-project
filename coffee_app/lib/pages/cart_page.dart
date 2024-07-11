import 'package:coffee_app/components/cart_item.dart';
import 'package:coffee_app/models/cart.dart';
import 'package:coffee_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getTotalCost(Cart cart) {
    double total = 0.0;
    List<Product> cartProducts = cart.getUserCart();
    for (Product product in cartProducts) {
      // Parse price to double, default to 0.0 if parsing fails
      total += double.tryParse(product.price) ?? 0.0;
    }
    return total;
  }

  void onTapBuy(Cart cart) {
    List<Product> cartProducts = cart.getUserCart();
    String text = "";
    if (cartProducts.isEmpty) {
      text = "You don't have anything in cart. Go buy something.";
    } else {
      text = "Thank you!";
    }

    Provider.of<Cart>(context, listen: false).removeAllItemFromCart();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text(text)),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ));
  }

  void removeFromCart(Product product) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Your Cart: ${value.getUserCart().length} items',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: value.getUserCart().length,
                  itemBuilder: (context, index) {
                    Product individualProduct = value.getUserCart()[index];
                    return CartItem(
                      product: individualProduct,
                      onTapDelete: () => removeFromCart(individualProduct),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Total: \$${getTotalCost(value).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                child: GestureDetector(
                  onTap: () => onTapBuy(value),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 175, 143, 111),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                            child: Text(
                          'Buy Now',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
