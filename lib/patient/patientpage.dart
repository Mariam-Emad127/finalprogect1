// import 'package:final_project/patient/reference.dart';
// import 'package:flutter/material.dart';
//
//   class PatientPage extends StatefulWidget {
//     const PatientPage({super.key}) ;
//
//     @override
//     State<PatientPage> createState() => _PatientPageState();
//   }
//
//   class _PatientPageState extends State<PatientPage> {
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         extendBodyBehindAppBar: true,
//       appBar: AppBar(
//        backgroundColor: Colors.transparent,
//         elevation: 0,
//         ),
//         body: Container(
//         child:SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//         child:
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:[
//               Container(
//               // patient6f5 (3:154)
//               margin: EdgeInsets.only(top: 30,right: 10,left: 10 ,bottom: 10),
//               child:
//               Center(
//                 child: Text(
//                   'patient page ',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.w700,
//                     height: 1.2575,
//                     color: Color(0xff439be8),
//                   ),
//                 ),
//               ),
//             ),
//                Container(
//                 margin: EdgeInsets.all(10),
//                 width: 340,
//                 height: 55,
//                 child:
//                 Stack(
//                   children: [
//                     Positioned(
//                       left: 0,
//                       top: 0,
//                       child:
//                       Container(
//                           padding: EdgeInsets.all(5),
//                           width: 340,
//                           height: 55,
//                           child:
//                           TextFormField(
//                             decoration: InputDecoration(
//                                 hintText: "name:",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(color: Colors.black,
//                                         width: 2))
//                             ),
//                           )
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Container(
//                 margin:EdgeInsets.all(10),
//                 width: 340,
//                 height: 55,
//                 child:
//                 Stack(
//                   children: [
//                     Positioned(
//                       // rectangle326MZ (3:158)
//                       left: 0,
//                       top: 0,
//                       child:
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         width:340,
//                         height: 55,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                               hintText: "age :",
//                               hintStyle: TextStyle(color: Colors.grey),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(color: Colors.black,
//                                       width: 2))
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 width: 340,
//                 height: 55,
//                 child:
//                 Stack(
//                   children: [
//                     Positioned(
//                       left: 0,
//                       top: 0,
//                       child:
//                       Container(
//                           padding: EdgeInsets.all(5),
//                           width: 340,
//                           height: 55,
//                           child:
//                           TextFormField(
//                             decoration: InputDecoration(
//                                 hintText: "phone number :",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(color: Colors.black,
//                                         width: 2))
//                             ),
//                           )
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Container(
//                 margin:EdgeInsets.all(10),
//                 width: 340,
//                 height: 150,
//                 child:
//                 Stack(
//                   children: [
//                     Positioned(
//                       // rectangle326MZ (3:158)
//                       left: 0,
//                       top: 0,
//                       child:
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         width:340,
//                         height: 150,
//                         child: TextFormField(
//                           maxLines: 10,
//                           decoration: InputDecoration(
//                               hintText: "treatment:",
//                               hintStyle: TextStyle(color: Colors.grey),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(color: Colors.black,
//                                       width: 2))
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Container(
//                 margin:EdgeInsets.all(10),
//                 width: 340,
//                 height:150,
//                 child:
//                 Stack(
//                   children: [
//                     Positioned(
//                       // rectangle326MZ (3:158)
//                       left: 0,
//                       top: 0,
//                       child:
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         width:340,
//                         height: 150,
//                         child: TextFormField(
//                           maxLines: 10,
//                           decoration: InputDecoration(
//                               hintText: "food system:",
//                               hintStyle: TextStyle(color: Colors.grey),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(color: Colors.black,
//                                       width: 2))
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             Row(
//               children: [
//                 SizedBox(width: 250,),
//                 TextButton(onPressed: (){ Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return Reference();
//                 }));},
//                     child: Text("Reference"),style: TextButton.styleFrom(primary: Color(0xff439be8),textStyle: TextStyle(fontSize: 20))),
//               ],
//             )
//           ]
//
//         )
//         ),
//         ),
//       );
//
//
//
//
//
//     }
//   }
//
import 'package:final_project/patient/support.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/theme_cubit.dart';
class PatientPage extends StatefulWidget {
  const PatientPage({super.key}) ;

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final _nameController=TextEditingController();
  final _ageController=TextEditingController();
  final _phoneNumberController=TextEditingController();
  final _treatmentController=TextEditingController();
  final _foodsystemController=TextEditingController();

  @override
  void dipose(){
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    _treatmentController.dispose();
    _foodsystemController.dispose();
    super.dispose();
  }
  Future Next()async{
    await patientdata(_nameController.text.trim(),
        int.parse(_ageController.text.trim(),),
        int.parse(_phoneNumberController.text.trim(),),
        _treatmentController.text.trim(),
        _foodsystemController.text.trim());
  }

  Future patientdata(String patientname,int age,int phonenumber,String treatment,String foodsystem)async{
    await FirebaseFirestore.instance.collection('PatientsPages').add({
      'name':patientname,
      'age':age,
      'phone number':phonenumber,
      'treatment':treatment,
      'foodsystem':foodsystem,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Text(""),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(height: 80,),
          BlocBuilder<ThemeCubit,bool>(
              builder: (context, state) {
                return SwitchListTile(
                  value: state,
                  onChanged:(value){
                    BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
                  },
                  title: Text("mode"),
                );
              }
          ),
          ListTile(
            title: Text("help"),
            leading: Icon(Icons.help),
          ),
          ListTile(
            title: Text("about"),
            leading: Icon(Icons.help_center),
          )
        ],),
      ),
      body: Container(
        child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    // patient6f5 (3:154)
                    margin: EdgeInsets.only(top: 10,right: 10,left: 10 ,bottom: 10),
                    child:
                    Center(
                      child: Text(
                        'patient page ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.2575,
                          color: Color(0xff439be8),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 340,
                    height: 55,
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
                              height: 55,
                              child:
                              TextFormField(
                                controller: _nameController,
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
                    height: 55,
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
                            height: 55,
                            child: TextFormField(
                              controller: _ageController,
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
                    height: 55,
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
                              height: 55,
                              child:
                              TextFormField(
                                controller: _phoneNumberController,
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
                    height: 150,
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
                            height: 150,
                            child: TextFormField(
                              controller: _treatmentController,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  hintText: "treatment:",
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
                    margin:EdgeInsets.all(10),
                    width: 340,
                    height:150,
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
                            height: 150,
                            child: TextFormField(
                              controller: _foodsystemController,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  hintText: "food system:",
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
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        Next();
                      }, child: Text("save"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF439be8),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          textStyle: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),

                        ),),
                      SizedBox(width: 25,),
                      ElevatedButton(onPressed: (){ Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return support();
                      }));},
                        child: Text("support"),style: ElevatedButton.styleFrom(
                          primary: Color(0xFF439be8),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          textStyle: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),

                        ),),
                    ],
                  )
                ]

            )
        ),
      ),
    );





  }
}

