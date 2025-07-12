import 'dart:developer';

import 'package:app_matic/src/model/model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Appmatic> _cart = [];
  List<Appmatic> get cart => _cart;
  double totalPriceValue = 0.0;

  void addtocart(Appmatic item) {
    final index = _cart.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      item.quantity = 1;
      _cart.add(item);
      totalPrice();
    }
    notifyListeners();
  }

  void add(int index) {
    _cart[index].quantity++;
    totalPrice();
    notifyListeners();
  }

  void remove(int index) {
    if (_cart[index].quantity == 1) {
      _cart.removeAt(index);
      totalPrice();
    } else {
      _cart[index].quantity--;
      totalPrice();
    }
    notifyListeners();
  }

  void totalPrice() {
    totalPriceValue = 0;
    for (int i = 0; i < _cart.length; i++) {
      totalPriceValue = totalPriceValue + _cart[i].quantity * _cart[i].price;
      log(totalPriceValue.toString());
    }
    notifyListeners();
  }
}
