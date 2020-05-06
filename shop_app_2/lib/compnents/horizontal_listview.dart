import 'package:flutter/material.dart';

class HorizontalListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(img_location: "assets/images/cats/tshirt.png",img_caption: "T-Shirt"),
          Category(img_location: "assets/images/cats/dress.png",img_caption: "Dress"),
          Category(img_location: "assets/images/cats/formal.png",img_caption: "Formal"),
          Category(img_location: "assets/images/cats/informal.png",img_caption: "Informal"),
          Category(img_location: "assets/images/cats/jeans.png",img_caption: "Jeans"),
          Category(img_location: "assets/images/cats/shoe.png",img_caption: "Shoes"),
          Category(img_location: "assets/images/cats/accessories.png",img_caption: "Jewllary",),
          
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final String img_location;
  final String img_caption;

  Category({
    this.img_location,
    this.img_caption
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2.0),

    child: InkWell(
      onTap: (){},
      child: Container(
        width: 80.0,
        child: ListTile(

          
          title: Image.asset(
            img_location,
            width: 100.0,
            height: 60.0,
          ),
    
          subtitle: Container(
            alignment: Alignment.topCenter,
          //  margin: EdgeInsets.only(top: 5.0),
           child: Text(img_caption,style: TextStyle(fontSize: 12.0),),
          )
        ),
      ),
    ),
      
    );
  }
}