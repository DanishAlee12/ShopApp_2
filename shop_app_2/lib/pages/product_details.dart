import 'package:flutter/material.dart';
import 'package:shop_app_2/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_newPrice;
  final product_detail_oldPrice;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_newPrice,
    this.product_detail_oldPrice,
    this.product_detail_picture 
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
            child: Text("ShopApp"),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
           
            new  IconButton(icon: Icon(Icons.search), onPressed: (){}),
              
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
            
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    widget.product_detail_picture,
                   // fit: BoxFit.cover,
                  ),
                ),
                footer: Container(
                  color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        widget.product_detail_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        ),
                      ),
                      title: Row(
                        children: <Widget>[

                          Expanded(
                            child: Text(
                              "\$"+widget.product_detail_oldPrice.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough
                              ),
                            )
                          ),

                           Expanded(
                            child: Text(
                              "\$"+widget.product_detail_newPrice.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                              ),
                            )
                          ),

                        ],
                        
                      )
                    )
                ),
              ),
            ),

    //    =========== First Button ==============
              Row(
                children: <Widget>[
              
    //    =========== Size Button ==============
                  Expanded(
                    child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.0,
                      onPressed: (){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Size"),
                              content: Text("Choose the size"),
                              actions: <Widget>[
                                new MaterialButton(
                                  onPressed: (){
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close",style: TextStyle(color: Colors.red),),
                                )
                              ],
                            );
                          }
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Size")),
                          Expanded(child: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    )
                  ),

//    =========== Color Button ==============
                   Expanded(
                    child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.0,
                      onPressed: (){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Color"),
                              content: Text("Choose the color"),
                              actions: <Widget>[
                                new MaterialButton(
                                  onPressed: (){
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close",style: TextStyle(color: Colors.red),),
                                )
                              ],
                            );
                          }
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Color")),
                          Expanded(child: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    )
                  ),

//    =========== Qty Button ==============
                   Expanded(
                    child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.0,
                      onPressed: (){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Quantity"),
                              content: Text("Choose the quantity"),
                              actions: <Widget>[
                                new MaterialButton(
                                  onPressed: (){
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close",style: TextStyle(color: Colors.red),),
                                )
                              ],
                            );
                          }
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Qty")),
                          Expanded(child: Icon(Icons.arrow_drop_down)),
                        ],
                      ),
                    )
                  ),

                ],
              ),


                  //    =========== Second Button ==============
               Row(
                  children: <Widget>[

//    =========== Qty Button ==============
                     Expanded(
                      child: MaterialButton(
                        color: Colors.red,
                        textColor: Colors.grey,
                        elevation: 0.0,
                        onPressed: (){},
                        child: Text("Buy Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      )
                    ),

                    IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red,), onPressed: (){}),

                    IconButton(icon: Icon(Icons.favorite,color: Colors.red,), onPressed: (){}),
                  ],
                ),
              Divider(),
             ListTile(
               title: Text("Product details:",style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
             ),
             Divider(),

             Row(
               children: <Widget>[
                 Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                 child: Text("Product Name :",style: TextStyle(color: Colors.grey)),
                ),
                Padding(padding: EdgeInsets.all(5.0),
                 child: Text(widget.product_detail_name, style: TextStyle(color: Colors.black)),
                ),
               ],
             ),

             Row(
               children: <Widget>[
                 Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                 child: Text("Brand Name :",style: TextStyle(color: Colors.grey)),
                ),
                Padding(padding: EdgeInsets.all(5.0),
                 child: Text("Brand X", style: TextStyle(color: Colors.black)),
                ),
               ],
             ),

             Row(
               children: <Widget>[
                 Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                 child: Text("Product Condition :",style: TextStyle(color: Colors.grey)),
                ),
                Padding(padding: EdgeInsets.all(5.0),
                 child: Text("New", style: TextStyle(color: Colors.black)),
                ),
               ],
             ),
        
          ],
        ),
      ),
    );
  }
}