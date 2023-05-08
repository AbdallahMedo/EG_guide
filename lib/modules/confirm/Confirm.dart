import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Confirm_password extends StatefulWidget {
  @override
  _Confirm_passwordState createState() => _Confirm_passwordState();
}
 class _Confirm_passwordState extends State<Confirm_password> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool obscureText=true;
  bool showPassword = true;
  bool showConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Confirm password",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () => setState(() => showPassword = !showPassword),
                      ),
                    ),
                    validator: (validator) {
                      if (validator!.isEmpty) return '*Required';
                      return null;
                    }),
                SizedBox(
                  height: 20.0,
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
                        icon: Icon(Icons.remove_red_eye),
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
                SizedBox(
                  height: 30.0,
                ),
                Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(143, 205, 216, 10),

                    ),
                    alignment: Alignment.center,
                    width: 300.0,

                    child: MaterialButton(
                      onPressed: () async {
                        _form.currentState!.validate();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


