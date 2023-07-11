import 'dart:math';
import 'package:flutter_svg/svg.dart';
import '../pageview/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'model.dart';
class page_view extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  page_view({required this.title,required this.description, required this.image});
  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(image, width: width * 0.6,),
          SizedBox(height: 60,),
          Text(title, style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 60,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(description, style: TextStyle(
                height: 1.5,
                fontSize: 14, fontWeight: FontWeight.normal , letterSpacing: 0.7
              ), textAlign:  TextAlign.center,),
          ),
          SizedBox(height: 60,),


        ],
      ),
    );

  }
}