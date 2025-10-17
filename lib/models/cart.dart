import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK',
      price: '236',
      imagePath: 'lib/images/Zoom_Freak.png',
      description: 'The Forward-Thinking design if his latest signature shoe.',
    ),

    Shoe(
      name: 'Air Jordan',
      price: '220',
      imagePath: 'lib/images/Air-Jordan-PNG-Free-File-Download.png',
      description:
          'Air Jordan 1 Mid Men\'s Shoes Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colors and crisp leather give it a distinct identity',
    ),

    Shoe(
      name: 'KD Trey',
      price: '220',
      imagePath: 'lib/images/KDTrey.png',
      description:
          'With its lightweight upper and plush support system, the KD Trey can help you float like KD, waiting for the perfect moment to drive to the hoop.',
    ),

    Shoe(
      name: 'Kyrie 6',
      price: '220',
      imagePath: 'lib/images/kyrie6.png',
      description:
          'Continuing to tell the history of ancient Egypt, Concepts honours the Egyptian god Khepri Ra, who represents the movement of the rising sun.',
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
