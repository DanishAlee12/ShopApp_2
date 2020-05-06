import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
 return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
            child: Column(

            children: <Widget>[

              Padding(padding: const EdgeInsets.only(top: 35,left: 30,right: 30,bottom: 30),
              child: Text(
                "Log in to your account",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0
                ),
              ),
            ),




           Padding(padding:const EdgeInsets.only(left: 20,right: 20),
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



           Padding(padding:const EdgeInsets.only(top: 10, left: 20,right: 20),
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

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[

              Padding(padding: const EdgeInsets.only(top: 10,left: 0),
              child: FlatButton(onPressed: (){

                Navigator.of(context).pushNamed('/signup');

              },
                child: Text("Don't have an account?",style: TextStyle(color: Colors.red),)
                ),
                ),


              Padding(padding: const EdgeInsets.only(top: 10,left: 0),
              child: FlatButton(onPressed: (){},
                child: Text("Forget Password?",style: TextStyle(color: Colors.red),)
                ),
                ),

             ],
           ),





           Padding(padding: const EdgeInsets.only(left: 15, right: 15,top: 30,bottom: 25.0),
           child: SizedBox(
           width: double.infinity,
            child: RaisedButton(
               elevation: 7.0,
              onPressed:(){

                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _email,
                  password: _password
                ).then((AuthResult auth) {})
                .then((FirebaseUser user){
                  Navigator.of(context).pushReplacementNamed('/homepage');

                }).catchError((e){
                  print(e);
                });
              },
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 90.0),
              child: Text(

                "LOGIN",
                style: TextStyle(
                 color: Colors.white,
                )
                ),
               ),
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
          ],

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


























////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shop_app_2/pages/home.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {

//   GoogleSignIn googleSignIn = new GoogleSignIn();
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences preferences;
//   bool loading = false;
//   bool islogedin = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     isSignedIn();
//   }

//     void isSignedIn() async{
//       setState(() {
//         loading =true;
//       });
//       preferences = await SharedPreferences.getInstance();
//       islogedin = await googleSignIn.isSignedIn();

//       if(islogedin){
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> new HomePage()));
//       }

//       setState(() {
//         loading = false;
//       });
//     }

//     Future handleSignIn() async{

//       preferences = await SharedPreferences.getInstance();

//       setState(() {
//         loading = true;
//       });

//   //     Future<String> _testSignInWithGoogle() async {
//   //   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//   //   final GoogleSignInAuthentication googleAuth =
//   //       await googleUser.authentication;
//   //   final AuthCredential credential = GoogleAuthProvider.getCredential(
//   //     accessToken: googleAuth.accessToken,
//   //     idToken: googleAuth.idToken,
//   //   );
//   //   final FirebaseUser user = await _auth.signInWithCredential(credential);
//   //   assert(user.email != null);
//   //   assert(user.displayName != null);
//   //   assert(!user.isAnonymous);
//   //   assert(await user.getIdToken() != null);


//   //   final FirebaseUser currentUser = await _auth.currentUser();
//   //   assert(user.uid == currentUser.uid);


//   //   return 'signInWithGoogle succeeded: $user';
//   // }

//     //   GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     //   GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
//     //   // FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
//     //   //   idToken: googleSignInAuthentication.idToken,
//     //   //   accessToken: googleSignInAuthentication.accessToken
//     //   // );

//     //   if(FirebaseUser != null){
//     //     final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo: firebaseUser.uid).getDocuments();
//     //     final List<DocumentSnapshot> documents = result.documents;
//     //     if(documents.length == 0){
//     //       // insert user to our collection
//     //       Firestore.instance
//     //         .collection("users")
//     //         .document(firebaseUser.uid)
//     //         .setData({
//     //           "id": firebaseUser.uid,
//     //           "username": firebaseUser.displayName,
//     //           "profilePicture": firebaseUser.photoUrl
//     //         });

//     //         await preferences.setString("id", firebaseUser.uid);
//     //         await preferences.setString("username", firebaseUser.displayName);
//     //         await preferences.setString("profilePicture", firebaseUser.displayName);
//     //     }else{

//     //       await preferences.setString("id", documents[0]["id"]);
//     //       await preferences.setString("username", documents[0]["username"]);
//     //       await preferences.setString("photoUrl", documents[0]["photoUrl"]);
//     //     }

//     //     Fluttertoast.showToast(msg: "Login was successful");
//     //     setState(() {
//     //       loading = false;
//     //     });

//     //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> new HomePage()));


//     //   }else{
//     //     Fluttertoast.showToast(msg: "Login Failed :("); 
//     //   }
//      }
    
//       @override
//       Widget build(BuildContext context) {
//         return SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               centerTitle: true,
//               title: new Text("Login", style: TextStyle(color: Colors.red.shade900),),
//               elevation: 0.5,
//             ),
//             body: Stack(
//               children: <Widget>[
//                 Center(
//                   child: FlatButton(
//                     color: Colors.red.shade900,
//                     onPressed: (){
//                       handleSignIn();
//                     }, 
//                     child: Text("Sign in / Sign up with google", style: TextStyle(color: Colors.white),),
 
//                 ),
//                 ),

//                 Visibility(
//                   visible: loading ?? true,
//                   child: Container(
//                     color: Colors.white.withOpacity(0.7),
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                     ),
//                   )
//                 )
//               ],
//             ),
//           ),
          
//         );
//       }
//     }
    
