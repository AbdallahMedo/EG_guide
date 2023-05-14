import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../layouts/home_screen.dart';
import '../../shared/components/components.dart';
import '../forget/Forget_first.dart';
import '../sign_up/User_sign.dart';

class Login_Page extends StatefulWidget {
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  bool isChecked=false;
  late var selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = null;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(var value) {
    setState(() {
      selectedRadio = value;
    });
  }

  var emailcontroller = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool showPassword = true;

  final formGlobalKey = GlobalKey<FormState>();
  bool _isUser = true;

  void _delete(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Please select type'),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    _isUser = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Sign_up()),

                    );
                  });
                },
                child: const Text('User'),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Sign_up()),
                  );
                },
                child: const Text('Driver'),
                isDefaultAction: false,
                isDestructiveAction: false,
              )
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else
                            return null;
                        },
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email ID',
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else
                            return null;
                        },
                        controller: _password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(showPassword?Icons.visibility:Icons.visibility_off),
                            onPressed: () => setState(() => showPassword = !showPassword),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                  MaterialPageRoute(

                                  builder: (contxt) => Forget_password(),
                                  ),
                              );
                            },
                            child: Text(
                              "Forget password ?",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      defaultButton(
                        backgroun: Color.fromRGBO(143, 205, 216, 10),
                        text: "Login",
                        theme: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        isUppercase: false,
                        function: (){
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>HomeScreen())
                            );
                          }
                        },

                      ),

                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2.0,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 2.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          GestureDetector(
                            onTap: (){
                            },
                            child: Container(

                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color: Colors.blue, width: 1)),
                              child: SvgPicture.asset(
                                "lib/icons/facebook.svg",
                                color: Colors.blue,
                                height: 27,

                              ),
                            ),
                          ),

                          SizedBox(
                            width: 22,
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all( color: Colors.blue,width: 1)),
                              child: SvgPicture.asset(
                                "lib/icons/google-plus.svg",
                                //cacheColorFilter: Colors.accents.any((element) => true),
                                height: 27,
                              ),
                            ),
                          ),
                        ],
                      ),
                        ],
                      ),
                ),

                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Didn\'t have account?',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          TextButton(

                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.lightBlue.withOpacity(.7),
                              ),
                            ),
                           // onPressed: _isUser == true ? () => _delete(context) : null,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(

                                  builder: (contxt) => Sign_up()
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

            ),
          ),
        );



  }
}
