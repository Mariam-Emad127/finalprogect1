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
  handleButtonClick(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Outlined Button Clicked!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Text(""),
      ),
      drawer: Drower(),
      body: Stack(
        children: [
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
          const SizedBox(height: 400),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("choose what you need to do",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFF439be8))),
              SizedBox(
                height: 50,
              ),
              Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Center(
                      child: Row(children: [
                    OutlinedButton.icon(
                      icon: Icon(Icons.question_answer, size: 50),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return QuizScreen();
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
                      label: Text("Question"),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    OutlinedButton.icon(
                      icon: Icon(Icons.contact_page, size: 50),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Patient();
                        }));
                      },
                      label: Text("your page"),
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
                    )
                  ])))
            ]),
          )
        ],
      ),
      //)
    );
  }
}
