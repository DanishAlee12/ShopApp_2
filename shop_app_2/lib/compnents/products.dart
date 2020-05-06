import 'package:flutter/material.dart';
import 'package:shop_app_2/pages/product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var product_list =[
    {
    "name": "Blazer",
    "picture": "assets/images/products/blazer1.jpeg",
    "old_price": 130,
    "price": 120,
    },
    {
    "name": "Pants",
    "picture": "assets/images/products/pants1.jpg",
    "old_price": 110,
    "price": 100,
    },
    {
    "name": "Shoe",
    "picture": "assets/images/products/shoe1.jpg",
    "old_price": 80,
    "price": 75,
    },
    {
    "name": "Hills",
    "picture": "assets/images/products/hills1.jpeg",
    "old_price": 180,
    "price": 150,
    },
    {
    "name": "Skirts",
    "picture": "assets/images/products/skt1.jpeg",
    "old_price": 155,
    "price": 135,
    },
    {
    "name": "Dress",
    "picture": "assets/images/products/dress1.jpeg",
    "old_price": 155,
    "price": 135,
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

      itemBuilder: (BuildContext context, int index){
       return Single_Product(
        product_name: product_list[index]['name'],
        product_picture: product_list[index]['picture'],
        product_oldPrice: product_list[index]['old_price'],
        product_price: product_list[index]['price'],
      );
     }
    );
  }
}


class Single_Product extends StatelessWidget {

  final product_name;
  final product_picture;
  final product_oldPrice;
  final product_price;

  Single_Product({
    this.product_name,
    this.product_picture,
    this.product_oldPrice,
    this.product_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Hero(
        tag: Text("Hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new ProductDetails(
                // Passing Values of Product to Product Details Page
                product_detail_name: product_name,
                product_detail_newPrice: product_price,
                product_detail_oldPrice: product_oldPrice,
                product_detail_picture: product_picture,
        
              )
            )),
            child: GridTile(
              footer: Container(
               // height: 40.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        product_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        )
                      )
                    ),
                    Expanded(
                      child: Text("\$$product_oldPrice",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,
                      decoration: TextDecoration.lineThrough),),
                    ),
                    Expanded(
                      child: Text("\$$product_price",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.red),),
                    ),
                  ],
                ),
              ),
              child: Image.asset(product_picture,fit: BoxFit.cover,),
            ),
          ),
        ),
      )
    );
  }
}