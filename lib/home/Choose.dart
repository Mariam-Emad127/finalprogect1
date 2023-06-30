import 'package:final_project/home/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:final_project/patient/patient.dart';
import 'package:final_project/patient/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/drawer.dart';
class CHoose extends StatefulWidget {
  const CHoose({Key? key}) : super(key: key);

  @override
  State<CHoose> createState() => _CHooseState();
}

class _CHooseState extends State<CHoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Text(""),
        ),
        drawer:Drower(),
        body: Container(
            padding: EdgeInsets.only(left: 20),
            child: Center(
                child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return QuizScreen();
                          }));
                        },
                        child: Text("Question"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF439be8),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          textStyle: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Patient();
                          }));
                        },
                        child: Text("your page"),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF439be8),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            textStyle: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                            )
                        ),
                      )]
                )
            )
        )
    );
  }
}
