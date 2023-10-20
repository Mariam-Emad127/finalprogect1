import 'dart:async';

import 'package:final_project/home/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:final_project/auth/login.dart';
import 'package:final_project/home/first_page.dart';

import '../../home/choose1.dart';
import '../component/drawer.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return loginScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff439be8),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Text(""),
      ),
      drawer: Drower(),
      body: Center(
        child: CircleAvatar(
          radius: 150,
          backgroundImage: AssetImage("assets/images/logo3.jpg"),
        ),
      ),
    );
  }
}
