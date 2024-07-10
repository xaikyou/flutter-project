import 'package:coffee_app/models/product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.product, required this.onTapDelete});

  final Product product;
  final Function()? onTapDelete;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
      child: ListTile(
        leading: Image.asset(widget.product.imagePath),
        title: Text(widget.product.name),
        subtitle: Text('\$${widget.product.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: widget.onTapDelete,
        ),
      ),
    );
  }
}
