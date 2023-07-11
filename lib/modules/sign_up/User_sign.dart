import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../layouts/home_screen.dart';
import '../../provider/auth_provider.dart';
import '../../shared/components/components.dart';
import '../firstmap/Test_Map.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  FirebaseAuth instance = FirebaseAuth.instance;
  bool isChecked = false;
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

  String? email;
  String? password;

  String? name;
  String? phone;

  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();

  var passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool obscureText = true;
  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AuthProvider>(context);
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 0.0, right: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*rquired';
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[a-z,A-Z]')),
                    FilteringTextInputFormatter.deny(r'[!-*]')
                  ],
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  controller: namecontroller,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*rquired';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      this.email = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _phonecontroller,
                  validator: (value) {

                    if (value!.isEmpty) {
                      return '*Required';
                    }
                  },
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    labelText: 'phone number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () =>
                            setState(() => showPassword = !showPassword),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        this.password = value;
                      });
                    },
                    validator: (validator) {
                      if (validator!.isEmpty) return '*Required';
                      return null;
                    }),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                    controller: _confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showConfirmPassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(showConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          });
                        },
                      ),
                    ),
                    validator: (validator) {
                      if (validator!.isEmpty) return '*Required';
                      if (validator != _password.text)
                        return 'The passwords do not match';
                      return null;
                    }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: 0,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setSelectedRadio(value);
                            }),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Radio(
                          value: 1,
                          activeColor: Colors.blue,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setSelectedRadio(value);
                          },
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),

                const SizedBox(height: 10),
                defaultButton(
                  backgroun: Color.fromRGBO(143, 205, 216, 10),
                  text: "SignUp",
                  theme: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  isUppercase: false,
                  function: () async {
                    if (await prov.signup(email, password,name) == false) {
                      Fluttertoast.showToast(
                          msg: 'Un valid register !',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          backgroundColor: Colors.lightBlueAccent,
                          fontSize: 16.0);
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
