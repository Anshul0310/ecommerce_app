import 'package:ecommerce_app_ui/components/glass_box.dart';
import 'package:ecommerce_app_ui/models/shoe.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final void Function()? onTap;
  const ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      child: GlassBox(
        borderRadius: 12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //shoe price
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: shoe.name, // Hero tag for animation
                child: Image.asset(shoe.imagePath),
              ),
            ),

            //description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                shoe.description,
                style: TextStyle(color: Colors.grey[200]), // Lighter text
              ),
            ),
            // price + details
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //shoe name
                      Text(
                        shoe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFFFFD700), // Batman Yellow
                        ),
                      ),

                      const SizedBox(height: 5),
                      //price
                      Text(
                        '\$${shoe.price}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  //plus button
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // button to add to cart
          ],
        ),
      ),
    );
  }
}
