import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../style/style.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  XFile? image;
  final ImagePicker _picker=ImagePicker();
   camaraImage()async{
   image=await _picker.pickImage(source: ImageSource.camera);
   setState(() {
   });
}

  bool Loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Loading
                    ? (const Center(child: CircularProgressIndicator()))
                    : (Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(onPressed: (){
                              camaraImage();
                            }, child: Icon(Icons.camera)),
                            Container(
                              child:  image == null ? Text('no data') : Image.file(File(image!.path)),
                              height: 100,
                            ),

                            Text("Updated Profile",
                                style: Head1Text(colorDarkBlue)),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: (){
                               camaraImage();
                              },
                              child: Container(
                                width: 330,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 1,color: Colors.grey)
                                ),
                                child: Row(
                                  children: [
                                      Container(
                                        padding:EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                          color: Colors.grey
                                        ),

                                        child: Center(child: Text('Photo',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                      ),
                                      Text(image?.name ?? ''),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration: AppInputDecoration("Email Address"),
                                onChanged: (Textvalue) {}),
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration: AppInputDecoration("First Name"),
                                onChanged: (Textvalue) {}),
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration: AppInputDecoration("Last Name"),
                                onChanged: (Textvalue) {}),
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration: AppInputDecoration("Mobile"),
                                onChanged: (Textvalue) {}),
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration: AppInputDecoration("Password"),
                                onChanged: (Textvalue) {}),
                            const SizedBox(height: 20),
                            Container(child: ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild('Update'),
                              onPressed: (){

                              },
                            ),)

                          ],
                        ),
                      ))),
          )
        ],
      ),
    ));
  }
}
