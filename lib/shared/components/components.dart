import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required  TextEditingController controler,
  required String label ,
  required TextInputType type,
   IconData? prefix,
  bool isobscure=false,
  dynamic Validator,
  IconData? suffex,
  Function? onTapicon,
  dynamic onTap,


})=>TextFormField(
  onTap: onTap,
  validator:Validator,
  obscureText:isobscure,
  keyboardType:type,
  controller:controler,
  decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius:BorderRadius.all(Radius.circular(15.0),),
        borderSide: BorderSide(
          color: Colors.orange,
          width: 5.0,
        ),


      ),
      prefixIcon: Icon(prefix),
      suffixIcon:IconButton(
        onPressed:(){
           onTapicon!();
        },
        icon:Icon(suffex),
      )
  ),

);