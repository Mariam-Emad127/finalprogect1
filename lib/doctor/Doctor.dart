import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/doctor/classification.dart';
import 'package:flutter/material.dart';
import '../home/theme_cubit.dart';
class Doctor extends StatefulWidget {
  const Doctor ({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  final _nameController=TextEditingController();
  final _ageController=TextEditingController();
  final _phoneNumberController=TextEditingController();
  final _governorateController=TextEditingController();

  @override
  void dipose(){
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    _governorateController.dispose();
    super.dispose();
  }
  Future Next()async{
    await doctordata(_nameController.text.trim(),
      int.parse(_ageController.text.trim(),),
      int.parse(_phoneNumberController.text.trim(),),
      _governorateController.text.trim(),);
  }

  Future doctordata(String Doctorname,int age,int phonenumber,String governorate)async{
    await FirebaseFirestore.instance.collection('doctors').add({
      'name':Doctorname,
      'age':age,
      'phone number':phonenumber,
      'governorate':governorate,
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
      body: Container(

        child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    padding: EdgeInsets.only(left:10,top: 40),
                    margin: EdgeInsets.only(top: 30,right:10,left: 10 ,bottom: 10),
                    child:
                     Text(
                        'Doctor ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.2575,
                          color: Color(0xff439be8),
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 340,
                    height: 70,
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
                              height: 70,
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
                    height: 70,
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
                            height: 70,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "age :",
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
                    margin: EdgeInsets.all(10),
                    width: 340,
                    height: 70,
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
                              height: 70,
                              child:
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "phone number :",
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
                    height: 70,
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
                            height:70 ,
                            child: TextFormField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                  hintText: "Governorate:",
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
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      SizedBox(width: 290,),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return classification();
                        }));

                      },
                        child: Text("Next"),
                        style: TextButton.styleFrom(primary: Color(0xff439be8),textStyle: TextStyle(fontSize: 30)),

                      ),
                    ],
                  )

                ]

            )),
      ),
    );
  }
}
