import 'package:ecommerce_app_ui/components/glass_box.dart';
import 'package:ecommerce_app_ui/models/cart.dart';
import 'package:ecommerce_app_ui/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GlassBox(
        borderRadius: 8,
        child: ListTile(
          leading: Image.asset(widget.shoe.imagePath),
          title: Text(
            widget.shoe.name,
            style: const TextStyle(
              color: Color(0xFFFFD700),
            ), // Batman Yellow
          ),
          subtitle: Text(
            widget.shoe.price,
            style: TextStyle(color: Colors.grey[200]), // Lighter text
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.white), // White icon
            onPressed: removeItemFromCart,
          ),
        ),
      ),
    );
  }
}
