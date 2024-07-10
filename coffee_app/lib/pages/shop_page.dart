import 'package:coffee_app/components/product_tile.dart';
import 'package:coffee_app/models/cart.dart';
import 'package:coffee_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      '"Your coffee choice make your day."',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 81, 45),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Coffees:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: value.getCoffeeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Product product = value.getCoffeeList()[index];
                    return ProductTile(product: product);
                  },
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Teas:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Product product = value.getTeaList()[index];
                    return ProductTile(product: product);
                  },
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Cakes:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Product product = value.getCakeList()[index];
                    return ProductTile(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
