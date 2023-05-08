import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../shared/components/components.dart';
import '../confirm/Confirm.dart';
class Verification_page extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  final String phone;
  Verification_page({required this.phone});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification",
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0,),
              Text(
                "We have sent a verification number to +02 $phone",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              TextButton(onPressed: () => Navigator.pop(context),
                child: Text(
                  "Change phone number",
                  style: TextStyle(
                    fontSize: 20.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return"Required";

                        };
                      },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '-',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),

                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Required";

                        }
                        },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        hintText: '-',
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Required";

                        }
                        },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))

                        ),
                        hintText: '-',
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Required";

                        }
                      },
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))

                        ),
                        hintText: '-',
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // decoration: const BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(15)),
                  //   color: Color.fromRGBO(143, 205, 216, 10),
                  //
                  // ),
                  // alignment: Alignment.center,
                  // width: 300.0,
                  //
                  // child: MaterialButton(
                  //   onPressed: () {
                  //     if(formKey.currentState!.validate()){
                  //       formKey.currentState!.save();
                  //
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) =>Confirm_password()),
                  //     );
                  //     }
                  //   },
                  //   child: Text(
                  //     "Verify",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20.0,
                  //     ),
                  //   ),
                  // ),
                  child: defaultButton(
                    backgroun: Color.fromRGBO(143, 205, 216, 10),
                    text: "Verify",
                    theme: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    isUppercase: false,
                    function: (){
    if(formKey.currentState!.validate()){
           formKey.currentState!.save();

         Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>Confirm_password()),
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
    );
  }
}
