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
      body: SingleChildScrollView(
        child: Column(
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

               "Last updated July 10, 2023/nAGREEMENT TO OUR LEGAL TERMS/nWe are Egy-Guide (Company, we, us, our), a company registered in Egypt at Shebin elkom , Menofia , Shebin elkom menofia \n"
                   "We operate the mobile application Egy_Guide (the App), as well as any other related products and services that refer or link to these legal terms the Legal Terms collectively, the  Services\n"
                   "This app help people to reach their destination step by step and write notes and draw lines in map and tracking their location to know where they are now and how much left for their destination\n"
                   "You can contact us by email at ____ or by mail to Shebin elkom , Menofia , Shebin elkom menofia , Egypt.\n"
                   "  These Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity (you), and Egy-Guide, concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all of these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.\n "
                   " Supplemental terms and conditions or documents that may be posted on the Services from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Legal Terms at any time and for any reason. We will alert you about any changes by updating the Last updated   date of these Legal Terms, and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Legal Terms to stay informed of updates. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Legal Terms by your continued use of the Services after the date such revised Legal Terms are posted.\n"
                   " All users who are minors in the jurisdiction in which they reside (generally under the age of 18) must have the permission of, and be directly supervised by, their parent or guardian to use the Services. If you are a minor, you must have your parent or guardian read and agree to these Legal Terms prior to you using the Services.\n We recommend that you print a copy of these Legal Terms for your records.",

             ),
           ),

          ],
        ),
      ),
    );
  }

}
