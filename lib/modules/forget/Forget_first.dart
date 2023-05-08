import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/components/components.dart';
import '../verification/Verification.dart';
class Forget_password extends StatefulWidget  {
   const Forget_password({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Forget_passwordState();
  }
}

class _Forget_passwordState extends State<Forget_password>  {

  final formGlobalKey = GlobalKey < FormState > ();
  var phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter your phone number',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: Expanded(
                      child: TextFormField(
                        //controller: phoneNumberController,
                        validator: (value){
                          if(value!.isEmpty){
                            //  r'^[0-9]{10}$' pattern plain match number with length 10
                            return "*Required";
                          }else if(value.length<11){
                            return "Enter Correct Phone Number";
                          } else if(!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                            return "Enter Correct Phone Number";
                          }else{
                            return null;
                          }
                        },

                        onChanged: (value) {
                          phone = value;
                        },
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(11),
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone number',
                        ),

                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "We will send a verification code to your phone numper",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    // decoration: const BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(15)),
                    //   color: Color.fromRGBO(143, 205, 216, 10),
                    //
                    // ),
                    // alignment: Alignment.center,
                    // width: 300.0,
                    // child: MaterialButton(
                    //   onPressed: () {
                    //   if(formGlobalKey.currentState!.validate()) {
                    //     formGlobalKey.currentState!.save();
                    //
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //
                    //         builder: (contxt) => Verification_page(
                    //           phone: phone,
                    //         ),
                    //
                    //       ),
                    //     );
                    //   }
                    //
                    //   },
                    //
                    //
                    //   child: Text(
                    //     "Send code",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20.0,
                    //     ),
                    //   ),
                    //
                    // ),

                    child: defaultButton(
                      backgroun: Color.fromRGBO(143, 205, 216, 10),
                      text: "Send code",
                      theme: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      isUppercase: false,
                      function: (){
                        if(formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();
                              Navigator.push(
                                         context,
                                         MaterialPageRoute(

                                           builder: (contxt) => Verification_page(
                                             phone: phone,
                                           ),

                                        ),
                                     );
                        }
                      },

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
