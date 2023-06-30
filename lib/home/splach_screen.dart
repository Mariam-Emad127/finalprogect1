import 'package:final_project/home/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:final_project/auth/login.dart';
import 'dart:async';
import 'package:final_project/home/first_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../../home/choose1.dart';
import '../component/drawer.dart';
import '../message/notification.dart';




class splash_screen extends StatefulWidget {
  const splash_screen({super.key}) ;

  @override
  State<splash_screen> createState() => _splash_screenState();
}
notification n=notification();

class _splash_screenState extends State<splash_screen> {
  @override

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder:(context){
        return loginScreen();
      }));
    }
    );
    Future.delayed(Duration(hours: 2) ,(){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder:(_) => choose1()
      ));
    });

    Workmanager().initialize(
       notification().callbackDispatcher,
        isInDebugMode:true
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff439be8),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Text(""),
      ),
      drawer: Drower() ,
      body:  Center(
        child: CircleAvatar(
          radius: 150,
          backgroundImage: AssetImage("assets/images/logo3.jpg"),
        ),
      ),
    );
  }
}