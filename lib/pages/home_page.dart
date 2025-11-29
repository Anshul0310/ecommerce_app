import 'package:ecommerce_app_ui/components/geometric_background.dart';
import 'package:ecommerce_app_ui/components/glass_box.dart';
import 'package:ecommerce_app_ui/pages/cart_page.dart';
import 'package:flutter/material.dart';

import 'shop_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Important for glass effect if needed
      backgroundColor: Colors.transparent, // Transparent for background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.menu, color: Colors.white), // White icon
                ),
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              icon: const Icon(
                Icons.shopping_bag,
                color: Color(0xFFFFD700), // Batman Yellow
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent, // Transparent for glass
        child: GlassBox(
          borderRadius: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // logo
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/black-nike-icon-on-white-background-4.png',
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(color: Colors.white.withValues(alpha: 0.2)),
                  ),

                  //other page
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Color(0xFFFFD700),
                      ), // Batman Yellow
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Color(0xFFFFD700),
                      ), // Batman Yellow
                      title: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color(0xFFFFD700),
                  ), // Batman Yellow
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GeometricBackground(
        child: const ShopPage(), // Directly show ShopPage
      ),
    );
  }
}
