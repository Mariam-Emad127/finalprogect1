import 'dart:io';
import 'package:final_project/component/drawer.dart';
import 'package:final_project/patient/patientpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart ';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../home/theme_cubit.dart';
class classification  extends StatefulWidget {
  const classification({super.key}) ;

  @override
  State<classification> createState() => _State();
}

class _State extends State<classification> {
  @override

  File ?file ;
  var imagepacker=ImagePicker();
  uploadImages()async{
    var imgpicked=await imagepacker.getImage(source: ImageSource.gallery);
    if(imgpicked!=null){
      file=File(imgpicked.path);
      var nameimage = basename(imgpicked.path);

      var refstorge= FirebaseStorage.instance.ref("images/$nameimage");
      await refstorge.putFile(file!);
      var url=refstorge.getDownloadURL();
      print("url:$url");

    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Text(""),
      ),
      drawer:Drower()  ,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("upload blood cell image",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Color(0xFF439be8) )),
            SizedBox(height: 20,),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/gallary.png"),
            ),
            SizedBox(height: 20,),
            Center(
                child: ElevatedButton(onPressed: ()async{
                  await uploadImages();
                },child: Text("upload Image"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF439be8),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    textStyle: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),



                  ),
                )
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return PatientPage();
              }));
            },child: Text("create patient page"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF439be8),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  textStyle: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )


            ),
          ]
      ),
    );
  }
}
