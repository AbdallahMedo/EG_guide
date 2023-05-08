import 'package:shared_preferences/shared_preferences.dart';

class ThemSharedPrefrences{
  static const Pref_Key='prefrence';
  SetThem(bool value) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(Pref_Key, value);
  }
  GetThem()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getBool(Pref_Key) ?? false;
  }
}
