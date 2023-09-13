import 'package:flutter/material.dart';
import 'package:taskmanager/api/network_request/network_request.dart';
import 'package:taskmanager/screen/onboarding/login_screen.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _form=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final TextEditingController _passController=TextEditingController();
  Map<String,String> FormValues={"email":"", "password":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child:Loading?(Center(child: CircularProgressIndicator())):(
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Form(
                        key: _form,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Join With Us", style: Head1Text(colorDarkBlue)),
                            SizedBox(height: 1),
                            Text("Learn with rabbil hasan", style: Head6Text(colorLightGray)),

                            SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                                decoration: AppInputDecoration("Email Address"),
                              validator: (String? value){
                                if(value?.isEmpty ?? true){
                                  return 'Enter your email address';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 20),
                            TextFormField(
                              controller: _firstNameController,
                                decoration: AppInputDecoration("First Name"),
                                validator: (String? value){
                                  if(value?.isEmpty ?? true){
                                    return 'Enter your first name';
                                  }
                                  return null;
                                },
                            ),

                            SizedBox(height: 20),
                            TextFormField(
                              controller: _lastNameController,
                                decoration: AppInputDecoration("Last Name"),
                              validator: (String? value){
                                if(value?.isEmpty ?? true){
                                  return 'Enter your last name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 20),
                            TextFormField(
                              controller: _mobileController,
                                decoration: AppInputDecoration("Mobile"),
                              validator: (String? value){
                                if(value?.isEmpty ?? true){
                                  return 'Enter your mobile number';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 20),
                            TextFormField(
                              controller: _passController,
                                decoration: AppInputDecoration("Password"),
                              validator: (String? value){
                                if(value?.isEmpty ?? true){
                                  return 'Enter your password';
                                }
                                return null;
                              },
                            ),




                            SizedBox(height: 20),
                            Container(child: ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild('Registration'),
                              onPressed: () async {
                                if(_form.currentState!.validate()){
                                 final result=await NetworkRequest().postRequest(
                                      'https://task.teamrabbil.com/api/v1/registration',
                                      {
                                        "email":_emailController.text,
                                        "firstName":_firstNameController.text,
                                        "lastName":_lastNameController.text,
                                        "mobile":_mobileController.text,
                                        "password":_passController.text,
                                        "photo":""
                                      }
                                  );
                                 if(result['status']=='success'){
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Registration Successful')));
                                   _emailController.text='';
                                   _firstNameController.text='';
                                   _lastNameController.text='';
                                   _mobileController.text='';
                                   _passController.text='';
                                 }
                                }

                              },
                            ),)

                          ],
                        ),
                      ),
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}