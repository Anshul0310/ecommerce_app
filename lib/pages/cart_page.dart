import 'package:ecommerce_app_ui/components/cart_item.dart';
import 'package:ecommerce_app_ui/components/geometric_background.dart';
import 'package:ecommerce_app_ui/models/cart.dart';
import 'package:ecommerce_app_ui/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GeometricBackground(
        child: Consumer<Cart>(
          builder:
              (context, value, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // heading
                    const Text(
                      'My Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFFFFD700), // Batman Yellow
                      ),
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: ListView.builder(
                        itemCount: value.getUserCart().length,
                        itemBuilder: (context, index) {
                          //get individual shoe
                          Shoe individualShoe = value.getUserCart()[index];

                          // return the cart item
                          return CartItem(shoe: individualShoe);
                        },
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
