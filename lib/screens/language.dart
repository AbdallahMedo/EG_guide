 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LanguageSwtch extends StatefulWidget {
  const LanguageSwtch({Key? key}) : super(key: key);

  @override
  _LanguageSwtchState createState() => _LanguageSwtchState();
}

class _LanguageSwtchState extends State<LanguageSwtch> {
  @override
  // void _changeLanguage(Language language){
  //   Locale _tmp;
  //   switch(language.languageCode){
  //     case"en":
  //       _tmp=Locale(language.languageCode,"US");
  //       break;
  //     case 'ar':
  //       _tmp=Locale(language.languageCode,'SA');
  //       break;
  //       default:
  //         _tmp=Locale(language.languageCode,"US");
  //
  //
  //   }
  //   MyApp.setLocale(context,_tmp);
  //
  // }


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
                  'Switch Language',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),

              ],

            ),
          ),
          SizedBox(height: 25.0,),
          MaterialButton(
              onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
              //  color: Colors.white,
                width: double.infinity,
                height: 30,
                child: Text(
                  'English',
                  style: TextStyle(
                    fontSize: 20.0,

                  ),
                ),
              ),
            ),
              ),
          SizedBox(height: 10.0,),
          MaterialButton(
            onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                width: double.infinity,
                height: 30,
                child: Text(
                    'Arabic',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
