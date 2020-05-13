import 'package:codex_test/core/provider/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Cart'),
      ),
      body: Consumer<CartModel>(
        builder:(context, model, _) => ListView.builder(
          itemCount: model.cart.length,
          itemBuilder: (context, index){
            return ListTile(title: Text(model.cart[index]));
          },
        ),
      ),
    );
  }
}