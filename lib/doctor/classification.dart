import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:final_project/component/drawer.dart';
import 'package:final_project/patient/patientpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart ';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class classification extends StatefulWidget {
  const classification({super.key});

  @override
  State<classification> createState() => _State();
}

class _State extends State<classification> {
  String? results;
  File? pickedImage;
  bool isPicked = false;
  var imagepacker = ImagePicker();
  var url = 'https://dbf7-197-54-183-175.ngrok-free.app/predictAPI';

  final ImagePicker _picker = ImagePicker();

  Future uploadImages() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = File(image.path);
      setState(() {
        isPicked = true;
      });

      var nameimage = basename(image.path);

      var refstorge = FirebaseStorage.instance.ref("images/$nameimage");
      await refstorge.putFile(pickedImage!);
      var url = refstorge.getDownloadURL();
      print("url:$url");
    }
  }

  upload() async {
    final request = http.MultipartRequest("POST", Uri.parse(url));
    final header = {"Content_type": "multipart/form-data"};
    request.files.add(http.MultipartFile('fileup',
        pickedImage!.readAsBytes().asStream(), pickedImage!.lengthSync(),
        filename: pickedImage!.path.split('/').last));
    request.headers.addAll(header);
    final myRequest = await request.send();
    http.Response res = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      print("response here: $resJson");
      results = resJson['prediction'];
      results = jsonEncode(resJson);
    } else {
      print("Error ${myRequest.statusCode}");
    }
    setState(() {});
  }

  @override
  void initState() {
    upload();
    super.initState();
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
        body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: isPicked
                    ? Image.file(
                        pickedImage!,
                        width: 300,
                        height: 300,
                      )
                    : Container(
                        color: Colors.blueGrey[100], width: 400, height: 400),
              ),
              SizedBox(
                height: 40,
              ),
              //   Center(
              Center(
                child: pickedImage == null
                    ? Text(
                        'THE MODEL HAS NOT BEEN PREDICTED',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      )
                    : Center(
                        child: pickedImage == null
                            ? Text(
                                'THE MODEL HAS NOT BEEN PREDICTED',
                                textAlign: TextAlign.center,
                              )
                            : Text('$results',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.photo),
                  onPressed: () async {
                    //await pickImage();
                    await uploadImages();
                  },
                  label: Text("picked Image"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF439be8),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.photo),
                onPressed: () async {
                  upload();
                },
                label: Text("load Image"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF439be8),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PatientPage();
                    }));
                  },
                  label: Text("create patient page"),
                  icon: Icon(Icons.create_new_folder),
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
            ]));
  }
}
