
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String English='en';
const String Arabic='ar';


const String LanguageCode='languageCode';


 Future<Locale?> setLocale(String languageCode)async{
  SharedPreferences _pref=await SharedPreferences.getInstance();

 await _pref.setString(LanguageCode, languageCode);


}

Locale? _locale(String languagecode){
   Locale? _temp;
   switch(languagecode){
     case English:
       _temp=Locale(languagecode,'US');
       break;
     case Arabic:
       _temp=Locale(languagecode,'SA');

   }
   return _temp;
}
