import 'package:flutter/widgets.dart';

class CartModel extends ChangeNotifier{

  List _cart =[];
  List get cart => _cart;
  set cart(List val){
    _cart.addAll(val);
    notifyListeners();
  }

}