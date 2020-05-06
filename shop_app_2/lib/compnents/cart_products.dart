import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var product_on_the_cart =[
    {
    "name": "Blazer",
    "picture": "assets/images/products/blazer1.jpeg",
    "price": 120,
    "size": "M",
    "color": "Black",
    "quantity": 1,
    },

    {
    "name": "Red Dress",
    "picture": "assets/images/products/dress1.jpeg",
    "price": 150,
    "size": "XL",
    "color": "Red",
    "quantity": 2,
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product_on_the_cart.length,
      itemBuilder: (context, int index){
        return Single_Cart_Product(

          cart_product_name: product_on_the_cart[index]["name"],
          cart_product_picture: product_on_the_cart[index]["picture"],
          cart_product_price: product_on_the_cart[index]["price"],
          cart_product_color: product_on_the_cart[index]["color"],
          cart_product_size: product_on_the_cart[index]["size"],
          cart_product_qty: product_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

class Single_Cart_Product extends StatelessWidget {

  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  Single_Cart_Product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0,4.0,10.0,0.0),
      child: Card(
        margin: EdgeInsets.only(top: 8.0),
        elevation: 6.0,
              child: ListTile(
                leading:  Image.asset(cart_product_picture,),
                
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,top: 6.0),
                  child: Text(cart_product_name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17.0),),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(bottom: 10.0),
                           child: Text("Size:"),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 5.0,right: 20.0,bottom: 10.0),
                           child: Text(cart_product_size,style: TextStyle(color: Colors.red)),
                         ),

                         Padding(
                           padding: const EdgeInsets.only(bottom: 10.0),
                           child: Text("Color:"),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 5.0,right: 20.0,bottom: 10.0),
                           child: Text(cart_product_color,style: TextStyle(color: Colors.red)),
                         ),

                        //  Padding(
                        //    padding: const EdgeInsets.only(bottom: 10.0),
                        //    child: Text("Qty:"),
                        //  ),
                        //  Padding(
                        //    padding: const EdgeInsets.only(left: 5.0,bottom: 10.0),
                        //    child: Text(cart_product_qty.toString(),style: TextStyle(color: Colors.red),),
                        //  ),
                        
                      ],
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6.0,),
                        child: Text(
                          "\$"+cart_product_price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.red,
                            fontSize: 15.0
                          ),
                        ),
                      )
                   ),
                   
                  ],
                ),

                trailing: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
        
                      Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_up),padding: EdgeInsets.only(top: 0.0), onPressed: (){})),
                       SizedBox(height: 8.0,),
                       Text(cart_product_qty.toString(),style: TextStyle(color: Colors.red),),
                       Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_down),padding: EdgeInsets.only(bottom: 5.0) ,onPressed: (){})),
                      
                    ],
                  ),
                ),
              
              ),
            
        ),
    );
    
  }
}