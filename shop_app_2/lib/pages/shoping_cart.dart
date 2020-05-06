import 'package:flutter/material.dart';
import 'package:shop_app_2/compnents/cart_products.dart';
import 'package:shop_app_2/pages/home.dart';

import '../main.dart';


class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
           elevation: 0.1,
          title: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Text("My Cart"),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
           
            new  IconButton(icon: Icon(Icons.search), onPressed: (){}),
              
          ],
        ),

         body: new CartProducts(),

        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text("Total:"),
                  subtitle: Text("\$234"),
                )
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.red,
                  onPressed: (){},
                  child: Text("Check out",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}