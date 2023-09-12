import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/email_verification_screen.dart';
import 'package:taskmanager/screen/onboarding/registration_screen.dart';

import '../../bottom_nav/bottom-nav_screen.dart';
import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

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
            child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
             padding: EdgeInsets.all(30),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Get Started With", style: Head1Text(colorDarkBlue)),
                 SizedBox(height: 1),
                 Text("Learn with rabbil hasan", style: Head6Text(colorLightGray)),
                 SizedBox(height: 20),

                 TextFormField(
                   onChanged: (Textvalue){
                     InputOnChange("email",Textvalue);
                   },
                   decoration: AppInputDecoration("Email Address"),
                 ),

                 SizedBox(height: 20),

                 TextFormField(
                   onChanged: (Textvalue){
                     InputOnChange("password",Textvalue);
                   },
                   decoration: AppInputDecoration("Password"),
                 ),

                 SizedBox(height: 20),


                 Container(child: ElevatedButton(
                   style: AppButtonStyle(),
                   child: SuccessButtonChild('Login'),
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>MainBottomNavigationBar()));
                   },
                 ),),

                 SizedBox(height: 20),
                 

                 Container(
                   alignment: Alignment.center,
                   child: Column(
                     children: [
                       SizedBox(height: 20),
                       InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>EmailVerificationScreen()));
                           },
                           child: Text('Forget Password?',style: Head7Text(colorLightGray),
                           )
                       ),

                       SizedBox(height: 15),

                       InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>RegistrationScreen()));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Don't have a account? ",style: Head7Text(colorDarkBlue)),
                               Text("Sign Up",style: Head7Text(colorGreen),)
                             ],
                           )
                       )
                     ],
                   ),
                 )
                 
                 
               ],
             ),
           )),
          )
        ],
      ),
    );
  }
}