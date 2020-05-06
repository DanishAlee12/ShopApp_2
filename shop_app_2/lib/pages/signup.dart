import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app_2/services/usermanagement.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: SafeArea(
           child: SingleChildScrollView(
                        child: Column(
             children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 35,left: 30,right: 30,bottom: 30),
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0
                ),
              ),
          ),

          Padding(padding: EdgeInsets.only(left: 20,right: 20),
          child: Card(
              elevation: 7.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(120.0))
                ),
               child: TextField(

                 onChanged: (value){
                   setState(() {
                     _email = value;
                   });
                 },
 
                style: TextStyle(fontSize: 15.0,color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.black
                      
                      ) 
                ),
                ),
              ),
             ),
         ),


         Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Card(
              elevation: 7.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(120.0))
                ),
               child: TextField(

                  onChanged: (value){
                   setState(() {
                     _password = value;
                   });
                 },

                 obscureText: true,
                style: TextStyle(fontSize: 15.0,color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black
                      
                      ) 
                ),
                ),
              ),
             ),
         ),




         Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 10),
          // child: Card(
          //     elevation: 7.0,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(120.0))
          //       ),
          //      child: TextField(
          //        obscureText: true,
          //       style: TextStyle(fontSize: 15.0,color: Colors.black),
          //         decoration: InputDecoration(
          //             contentPadding: EdgeInsets.all(8.0),
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(5.0),
          //               borderSide: BorderSide(
          //                 color: Colors.white,
          //               ),
          //             ),
          //             focusedBorder: OutlineInputBorder(
          //               borderSide: BorderSide(
          //                 color: Colors.white,
          //               ),
          //               borderRadius: BorderRadius.circular(5.0),
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //               borderSide: BorderSide(
          //                 color: Colors.white,
          //               ),
          //               borderRadius: BorderRadius.circular(5.0),
          //             ),
          //             hintText: "Confirm Password",
          //             hintStyle: TextStyle(
          //               fontSize: 15.0,
          //               color: Colors.black,
          //             ),
          //             prefixIcon: Icon(
          //               Icons.lock_outline,
          //               color: Colors.black
                      
          //             ) 
          //       ),
          //       ),
          //     ),
          //    ),
         ),

             Padding(padding:  EdgeInsets.only(left: 15, right: 15,top: 30,bottom: 25.0), 
         child: SizedBox(
         width: double.infinity,
          child: RaisedButton(
               elevation: 7.0,
              onPressed: (){

                FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email,
                  password: _password
                ).then((signInUser){

                  UserManagement().storeNewUser(signInUser,context);
                }).catchError((e){
                  print(e);
                });

              },
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 90.0),
              child: Text(
        
                "SIGN UP",
                style: TextStyle(
                 color: Colors.white,
                )
                ),
               ),
         ),
             ),

             Padding(padding: const EdgeInsets.only(top: 10,left: 0), 
              child: FlatButton(onPressed: (){

                Navigator.of(context).pushNamed('/landingpage');

              },
                child: Text("Already have an account",style: TextStyle(color: Colors.red),)
                ),
                ),


               Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(
                  color: Colors.red,
                  height: 0,
                ),
              ),

 Padding(padding: const EdgeInsets.only(top: 40),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 CircularButton(
                   onpressed: (){},

                   iCon: Image.asset(
                     'Assets/fb_logo.png',
                     color: Colors.white,
                   ),
                   bgcolor: Colors.blue[800],
                 ),

                  CircularButton(
                   onpressed: (){},
                   bgcolor: Colors.blue,
                   iCon: Image.asset(
                     'Assets/google_logo.png',
                      color: Colors.blue[800]
                   ),
                 ),
               ],
             )

 )



             ]
        ),
           ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {

  const CircularButton(
    {Key key,@required this.iCon , @required this.onpressed , this.bgcolor = Colors.white}
    ) : super(key : key);



  final Color bgcolor;
  final Image iCon;
  final void Function() onpressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: new CircleBorder(),
      elevation: 4.0,
       onPressed: onpressed,
       fillColor: bgcolor,
       padding: const EdgeInsets.all(4.0),
       child: CircleAvatar(
         child: iCon,
         backgroundColor: Colors.transparent,
       ),
      
      );
  }
}


TextStyle setTextStyle(
    {color = Colors.white,
    double textScaleConstant = 0,
    //family = 'Montserrat',
    weight = FontWeight.normal}) {
  return TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: GlobalCache.instance.fontSize + textScaleConstant,
    //fontFamily: family,
  );
}

class GlobalCache {
  GlobalCache._privateConstructor();
  static final GlobalCache instance = GlobalCache._privateConstructor();

  int breathConfig = 4;
  double fontSize = 14;
}
