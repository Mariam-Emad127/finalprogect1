import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../patient/support.dart';

// class cloud extends StatefulWidget {
//   const cloud({super.key});
//
//   @override
//   State<cloud> createState() => _cloudState();
// }
//
// class _cloudState extends State<cloud> {
//   List  PatientsPages=[];
//   CollectionReference usersref = FirebaseFirestore.instance.collection('PatientsPages');
//
//   getData() async {
//     var responsebody= await usersref.get();
//     responsebody.docs.forEach((element) {
//       setState(() {
//         PatientsPages.add(element.data());
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body:
//          ListView.builder(
//             itemCount: PatientsPages.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                   title: Text("name: ${PatientsPages[i]['name']}"),
//                   subtitle: Text("age : ${PatientsPages[i]['age']}"),
//               );
//
//
//             }
//         ),
//               // ListView.builder(
//               //     itemCount: PatientsPages.length,
//               //     itemBuilder: (context, i) {
//               //       return ListTile(
//               //         title: Text("foodsystem: ${PatientsPages[i]['foodsystem']}"),
//               //         subtitle: Text("phone number : ${PatientsPages[i]['phone number']}"),
//               //       );
//               //
//               //
//               //     }
//               // ),
//               // ListView.builder(
//               //     itemCount: PatientsPages.length,
//               //     itemBuilder: (context, i) {
//               //       return ListTile(
//               //         title: Text("treatment: ${PatientsPages[i]['treatment']}"),
//               //        // subtitle: Text("age : ${PatientsPages[i]['age']}"),
//               //       );
//               //
//               //
//               //     }
//               // ),
//
//
//     );
//   }
// }

class cloud extends StatefulWidget {
  const cloud({super.key});

  @override
  State<cloud> createState() => _cloudState();
}

class _cloudState extends State<cloud> {
  List PatientsPages = [];
  final usersref = FirebaseFirestore.instance
      .collection('PatientsPages')
      .where("name", isEqualTo: "mariam");

  getData() async {
    var responsebody = await usersref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        PatientsPages.add(element.data());
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: PatientsPages.length,
        itemBuilder: (context, i) {
          return ListTile(
              title: Column(
            children: [
              Text(
                "name:${PatientsPages[i]['name']}",
                style: TextStyle(color: Colors.cyan, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text("age:${PatientsPages[i]['age']}"),
              SizedBox(
                height: 10,
              ),
              Text("phone number:${PatientsPages[i]['phone number']}"),
              SizedBox(
                height: 10,
              ),
              Text("Treatment:${PatientsPages[i]['treatment']}"),
              SizedBox(
                height: 10,
              ),
              Text("food system:${PatientsPages[i]['foodsystem']}"),
              SizedBox(
                height: 10,
              ),
              Text("_______________________________________________"),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("support");
                  },
                  child: Text("support"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF439be8),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))
            ],
          ));
          //  title : Text("name: ${PatientsPages[i]['name']}"),
        },
      ),
    );
  }
}
