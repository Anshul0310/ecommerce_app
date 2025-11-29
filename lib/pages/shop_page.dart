import 'package:ecommerce_app_ui/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            children: [
              // search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark Grey Box
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ), // Subtle border
                  ),
                  child: Row(
                    children: const [
                      Text('Search', style: TextStyle(color: Colors.grey)),
                      Spacer(),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                ),
              ),

              //message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'everyone flies.. some fly longer than other',
                  style: TextStyle(color: Colors.grey[200]), // Lighter text
                ),
              ),
              // hot picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Hot Picks 🔥',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFFFFD700), // Batman Yellow
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: value.getShoeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //get a shoe from shop list
                    Shoe shoe = value.getShoeList()[index];
                    // Staggered animation
                    return TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(milliseconds: 500 + (index * 200)),
                      builder: (context, double val, child) {
                        return Opacity(
                          opacity: val,
                          child: Transform.translate(
                            offset: Offset(0, 50 * (1 - val)),
                            child: child,
                          ),
                        );
                      },
                      child: ShoeTile(
                        shoe: shoe,
                        onTap: () => value.addItemToCart(shoe),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25), // Spacer instead of Divider
            ],
          ),
    );
  }
}
