import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/component/drawer.dart';
import 'package:final_project/doctor/Doctor.dart';
import 'package:final_project/home/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project/home/Choose.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choose1 extends StatefulWidget {
  const choose1({super.key});

  @override
  State<choose1> createState() => _choose1State();
}

class _choose1State extends State<choose1> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }

  handleButtonClick(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Outlined Button Clicked!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Text(""),
        ),
        drawer: Drower(),
        body: Stack(children: [
          const SizedBox(height: 13),
          Container(
              height: 160,
              width: 400,
              child: Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/logo3.jpg"),
                ),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(top: 200),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text("choose who are you",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xFF439be8))),
                SizedBox(
                  height: 60,
                ),
                Container(
                    padding: EdgeInsets.only(left: 30),
                    //color: Colors.blue,
                    child: Center(
                      child: Row(children: [
                        OutlinedButton.icon(
                          icon: Icon(
                            Icons.local_hospital,
                            color: Colors.blue,
                            size: 50,
                          ),
                          onPressed: () {
                            handleButtonClick(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Doctor();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            //Style the text
                            textStyle: const TextStyle(
                              fontSize: 20, //Set font size
                            ),
                            //Style the border
                            side: const BorderSide(
                              color: Colors.green,
                              //Set border color
                              width: 2, //Set border width
                            ),
                            onPrimary: Colors.blue,
                            //Set the foreground (text + icon) color
                            padding: const EdgeInsets.all(
                                10.0), //Set the padding on all sides to 20px
                          ),
                          label: Text(
                            "Doctor",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OutlinedButton.icon(
                          icon: Icon(Icons.people_alt,
                              color: Colors.blue, size: 50),
                          onPressed: () {
                            handleButtonClick(context);

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return CHoose();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            //Style the text
                            textStyle: const TextStyle(
                              fontSize: 20, //Set font size
                            ),
                            //Style the border
                            side: const BorderSide(
                              color: Colors.green,
                              //Set border color
                              width: 2, //Set border width
                            ),
                            onPrimary: Colors.blue,
                            //Set the foreground (text + icon) color
                            padding: const EdgeInsets.all(
                                10.0), //Set the padding on all sides to 20px
                          ),
                          label: Text("patient"),
                        ),
                      ]),
                    )),
              ]))
        ]));
  }
}
