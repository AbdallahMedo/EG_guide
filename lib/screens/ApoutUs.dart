 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conditions extends StatefulWidget {
  const Conditions({Key? key}) : super(key: key);

  @override
  _ConditionsState createState() => _ConditionsState();
}

class _ConditionsState extends State<Conditions> {
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
                  'Terms And Conditions',
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
             'Terms and conditions',
           ),
         ),

        ],
      ),
    );
  }

}
