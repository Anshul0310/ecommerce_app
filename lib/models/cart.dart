import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak 2',
      price: '236',
      imagePath: 'lib/images/Zoom_Freak.png',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),

    Shoe(
      name: 'Air Jordan 1 Mid',
      price: '220',
      imagePath: 'lib/images/Air-Jordan-PNG-Free-File-Download.png',
      description:
          'Inspired by the original AJ1, this mid-top edition maintains the iconic look you love.',
    ),

    Shoe(
      name: 'KD Trey 5 VIII',
      price: '220',
      imagePath: 'lib/images/KDTrey.png',
      description:
          'Lightweight upper and plush support system for floating like KD.',
    ),

    Shoe(
      name: 'Kyrie 6 \'Egypt\'',
      price: '220',
      imagePath: 'lib/images/kyrie6.png',
      description:
          'Honoring the Egyptian god Khepri Ra, representing the rising sun.',
    ),

    Shoe(
      name: 'Air Force 1 Ambush',
      price: '190',
      imagePath: 'lib/images/Air_Force_1_Ambush.jpg',
      description:
          'A bold collaboration featuring exaggerated details and premium leather.',
    ),

    Shoe(
      name: 'Nike Dunk High Ambush',
      price: '180',
      imagePath: 'lib/images/Nike_Dunk_High_Ambush.webp',
      description:
          'Deep Royal Blue meets white and black in this exaggerated Dunk High design.',
    ),
  ];
  // list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
