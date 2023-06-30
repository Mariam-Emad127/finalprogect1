import 'package:final_project/patient/patientpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/theme_cubit.dart';
class Patient extends StatefulWidget {
  const Patient({super.key})  ;

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  final _nameController=TextEditingController();
  final _codeController=TextEditingController();
  @override
  void dipose(){
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();}
  Future Next()async{
    await patientcode(_nameController.text.trim(),
        int.parse(_codeController.text.trim(),));
  }

  Future patientcode(String patientname,int code)async{
    await FirebaseFirestore.instance.collection('patients').add({
      'name':patientname,
      'code':code,
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40,left: 10),
              margin: EdgeInsets.only(top: 30,right: 10,left: 10 ,bottom: 10),
              child:
              Text(
                'patient ',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  height: 1.2575,
                  color: Color(0xFF439be8),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70,left: 10,bottom: 10),
              width: 340,
              height: 65,
              child:
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child:
                    Container(
                        padding: EdgeInsets.all(5),
                        width: 340,
                        height: 65,
                        child:
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "name:",
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black,
                                      width: 2))
                          ),
                        )
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin:EdgeInsets.all(10),
              width: 340,
              height: 65,
              child:
              Stack(
                children: [
                  Positioned(
                    // rectangle326MZ (3:158)
                    left: 0,
                    top: 0,
                    child:
                    Container(
                      padding: EdgeInsets.all(5),
                      width:340,
                      height: 65,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "code:",
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black,
                                    width: 2))
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(

                margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                width: 270,
                height: 60,
                child:
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PatientPage();
                      }));
                    },
                    child: Text("my page"),
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
                )
            ),
          ],
        ),
    );
  }}
