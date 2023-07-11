 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Us extends StatelessWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top: 40.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:Icon(Icons.arrow_back_ios_outlined)),
                Text(
                  'ِAboutUs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),

              ],

            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Hello, welcome to our app.\nWe are a team in the faculty of computer and Information Menofia University, we present to you the app which helps you to find your way to the public transport when you lost in Menofia governorate specifically in Shebin El-kom.\nAll you have to do is enter your destination (the place you are looking for) then we will tell you the full path with written notes which will lead you to your desired location.\nWe build this from A to Z and when we talk about us,\nwe must mention …\nOur leader Abdallah Ayman Khahla who leads our team well and the members of the team is …\nAbdallah Mohamed Aboghazalh\nAhmed Mostafa Saad\nKareem Magdy Ali\nMeena-Allah Mohsen Bedda\nSalma Rasmi Zain-Elden\nIt’s our honor to lead you when you lost\n",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
