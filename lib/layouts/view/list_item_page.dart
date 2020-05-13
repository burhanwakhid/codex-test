import 'package:codex_test/core/provider/cart_model.dart';
import 'package:codex_test/layouts/view/list_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('list Item'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ListCartPage();
        })))
        ],
      ),
      body: ListView.builder(
        itemCount: itemNames.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(itemNames[index]),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border), 
              onPressed: (){
                cart.cart.add(itemNames[index]);
                print(cart.cart.length);
              }
            ),
          );
        },
      ),
    );
  }
}

List itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];