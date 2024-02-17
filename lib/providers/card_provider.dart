import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/model/cardItem.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(CartItem newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
  double total = 0;
  for (var item in _items) {
    total += item.price * item.quantity;
  }
  return total;
}

  int get itemCount {
    return _items.length;
  }
}
