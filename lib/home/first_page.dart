// import 'package:final_project/auth/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'package:final_project/auth/login.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class first extends StatefulWidget {
//   const first({super.key});
//
//   @override
//   State<first> createState() => _firstState();
// }
//
// class _firstState extends State<first> {
//   late UserCredential userCredential;
//
//   Future<UserCredential> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//
//         padding: EdgeInsets.only(top: 150, right: 50, left: 50),
//         child: Center(
//           child: Form(
//             key: formstate,
//             child: Column(
//
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 60,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) {
//                         return loginScreen();
//                       }));
//                     },
//                     child: Text("login"),
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF439be8),
//                       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                       textStyle: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 60,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) {
//                         return signup();
//                       }));
//                     },
//                     child: Text("sign up"),
//                     style: ElevatedButton.styleFrom(
//                         primary: Color(0xFF439be8),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         textStyle: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         )),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(right: 30, left: 30),
//                   child: Row(
//                     children: [
//                       MaterialButton(
//                         onPressed: () {
//                         },
//                         child: CircleAvatar(
//                           radius: 35,
//                           backgroundImage:
//                               AssetImage("assets/images/facebook-icon-24.jpg"),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       MaterialButton(
//                         onPressed: () async {
//                         UserCredential cred = await signInWithGoogle();
//                         print(cred);
//                         Navigator.of(context).pushReplacementNamed("choose1");
//                                                                              },
//                         child: CircleAvatar(
//                           radius: 35,
//                           backgroundImage: AssetImage(
//                               "assets/images/google-icon-search-16.jpg"),
//                         ),
//                       ),
//                       //   IconButton(onPressed: (){}, icon: Icon(Icons.))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:final_project/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:final_project/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  late UserCredential userCredential;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  var myusername,mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 150, right: 50, left: 50),
        child: Container(
            child: Form(
              key: formstate,
              child: Column(
                children: [
                     ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return loginScreen();
                        }));
                      },
                      child: Text("login"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF439be8),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                     SizedBox(
                    height: 30,
                  ),
                     ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return signup();
                        }));
                      },
                      child: Text("sign up"),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF439be8),
                          padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                     SizedBox(
                    height: 30,
                  ),
                      Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                            AssetImage("assets/images/facebook-icon-24.jpg"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                          onPressed: () async {

                            _googleSignIn.signIn().then((userData) {
                              setState(() {
                                _isLoggedIn = true;
                                _userObj = userData!;
                              });
                            }).catchError((e) {
                              print(e);
                            });

                             Navigator.of(context).pushReplacementNamed("choose1");
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                                "assets/images/google-icon-search-16.jpg"),
                          ),
                        ),
                        //   IconButton(onPressed: (){}, icon: Icon(Icons.))
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
