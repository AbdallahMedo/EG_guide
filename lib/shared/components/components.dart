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
        borderRadius:BorderRadius.all(
          Radius.circular(15.0),

        ),
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

Widget defaultButton({
  double width=400.0,
  Alignment alignment= Alignment.center,
  VoidCallback? function,
  double radius =15,
  required String text,
  required TextStyle theme,
  bool isUppercase =true,
  required Color backgroun,
}) =>Container(
  width: 400.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color:Color.fromRGBO(143, 205, 216, 10),
  ),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUppercase? text.toUpperCase(): text,
      style: theme,
    ),
  ),
);