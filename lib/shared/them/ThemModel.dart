import 'package:flutter/cupertino.dart';
import 'package:ttttt/shared/them/them_sharedPreference.dart';

class ThemModel extends ChangeNotifier{
  late bool _isDark;
  late ThemSharedPrefrences themSharedPrefrences;
  bool get isDark =>_isDark;


  ThemModel(){
    _isDark=false;
    themSharedPrefrences=ThemSharedPrefrences();
    getThemPrefrence();
  }
  set isDark(bool value){
    _isDark=value;
    themSharedPrefrences.SetThem(value);
    notifyListeners();
  }
  getThemPrefrence()async{
    _isDark=await themSharedPrefrences.GetThem();
    notifyListeners();
  }
}