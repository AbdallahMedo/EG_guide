 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}
 GlobalKey<FormState> _formkey = GlobalKey<FormState>();
 var usercontroler = TextEditingController();
 var passwordcontroler = TextEditingController();
 var confirmcontroler = TextEditingController();
 var phonecontroler = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  bool _isobscure=true;
  bool _isObscure=true;
  void toggle(){
    setState(() {
      _isobscure=!_isobscure;
    });
  }
  void newPass(){
    setState(() {
      _isObscure=!_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key:_formkey ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 40.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_outlined),
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),

                  ],
                ),

              ),
              SizedBox(height: 25.0,),
              Center(
                child: Stack(

                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/user2.png'),
                      radius: 80.0,

                    ),
                    Positioned(
                      bottom: 5.0,
                      right: 10.0,
                      child:IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.camera_alt,
                          size: 35.0,
                          color: Colors.teal,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 40.0,right: 15.0),
                child: Column(
                  children: [
                    defaultFormField(
                      label: 'Username',
                      controler: usercontroler,
                      type:TextInputType.text,
                      onTap: (){},
                    ),
                    SizedBox(height: 20.0,),
                    defaultFormField(
                        controler: passwordcontroler,
                        label: 'Old Password',
                        type: TextInputType.visiblePassword,
                      isobscure: _isobscure,
                      suffex:_isobscure?Icons.visibility:Icons.visibility_off,
                      onTapicon: (){
                          toggle();
                      }
                    ),
                    SizedBox(height: 20.0,),
                    defaultFormField(
                        controler: confirmcontroler,
                        label: 'New Password',
                        type: TextInputType.visiblePassword,
                        isobscure: _isObscure,
                        suffex:_isObscure?Icons.visibility:Icons.visibility_off,
                        onTapicon: (){
                         newPass();
                        }
                    ),
                    SizedBox(height: 20.0,),
                    defaultFormField(
                        controler: phonecontroler,
                        label: 'Phonenumber',
                        type: TextInputType.phone,
                    ),


                  ],
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
