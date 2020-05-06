import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shop_app_2/compnents/horizontal_listview.dart';
import 'package:shop_app_2/compnents/products.dart';
import 'package:shop_app_2/pages/shoping_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget image_carousel = new Container(
  //  margin: EdgeInsets.all(10.0),
    height: 180.0,
   // width: MediaQuery.of(context).size.width,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage("assets/images/c1.jpg"),
     //   AssetImage("assets/images/IMG_1266.JPG"),
        AssetImage("assets/images/m1.jpeg"),
        AssetImage("assets/images/m2.jpg"),
        AssetImage("assets/images/w1.jpeg"),
        AssetImage("assets/images/w3.jpeg"),
        AssetImage("assets/images/w4.jpeg"),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 0.0,
      dotBgColor: Colors.transparent,


    ),
  );

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         appBar: new AppBar(
           elevation: 0.1,
          title: Text("ShopApp"),
          backgroundColor: Colors.red,
          actions: <Widget>[
           
            new  IconButton(icon: Icon(Icons.search), onPressed: (){}),
            new  IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new ShoppingCart()));
            }),
              
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              // Drawer Header
              new UserAccountsDrawerHeader(
                accountName: Text("Danish Alee"),
                accountEmail: Text("danishalee44@gmail.com"),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.person, color: Colors.white,size: 40.0,),
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  GestureDetector(
                    child: CircleAvatar(
                       backgroundColor: Colors.red,
                       child: Icon(Icons.person, color: Colors.white,size: 20.0,),
                    ),
                  )
                ],
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage("assets/images/drwaer_img.jpg"),
                    fit: BoxFit.cover,
  
                  )
                ),
              ),

              // Drwaer body
              ListTile(
                leading: Icon(Icons.home,color: Colors.red),
                title: Text("Home Page", style: TextStyle(fontSize: 17.0),),
                onTap: (){},
              ),
              Divider(height: 1.0,color: Colors.white,),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.person,color: Colors.red),
                title: Text("My Account", style: TextStyle(fontSize: 17.0),),
              ),
              Divider(height: 1.0,color: Colors.white,),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.shopping_basket,color: Colors.red),
                title: Text("My Oders", style: TextStyle(fontSize: 17.0),),
              ),
              Divider(height: 1.0,color: Colors.white,),
              ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new ShoppingCart()));
                },
                leading: Icon(Icons.shopping_cart,color: Colors.red),
                title: Text("Shoping Cart", style: TextStyle(fontSize: 17.0),),
              ),
              Divider(height: 1.0,color: Colors.white,),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.favorite,color: Colors.red),
                title: Text("Favourites", style: TextStyle(fontSize: 17.0),),
              ),
              Divider(height: 12.0,),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.settings,),
                title: Text("Settings", style: TextStyle(fontSize: 17.0),),
              ),
              Divider(height: 1.0,color: Colors.white,),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.help,),
                title: Text("About", style: TextStyle(fontSize: 17.0),),
              ),
              Divider(height: 1.0,color: Colors.white,),
              ListTile(
                onTap: (){
                  
                  FirebaseAuth.instance.signOut()
                  .then((value){
                    Navigator.of(context).pushReplacementNamed('/landingpage');
                  })
                  .catchError((e){
                    print(e);
                  
                  });
                },
                leading: Icon(Icons.lock,),
                title: Text("Logout", style: TextStyle(fontSize: 17.0),),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
            children: <Widget>[

              // Image Slider
              image_carousel,

              // Categories (Text)
              new Padding(padding: EdgeInsets.only(top: 10.0),
              child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              ),

              // Horizontal Categories with Images
              HorizontalListview(),

              // Recent Product (Text)
              new Padding(padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
              child: Text("Recent Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              ),

              // Gridview (Recent Product)
              Container(
                height: 320,
                child: Products(),
              )
            ]
          ),
        ),
      ),
    );
  }
}