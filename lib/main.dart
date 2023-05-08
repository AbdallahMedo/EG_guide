import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttttt/shared/them/ThemModel.dart';

import 'layouts/home_screen.dart';
import 'modules/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ThemModel(),
      child:Consumer(builder: (context,ThemModel themModel,child){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themModel.isDark? ThemeData.dark():ThemeData.light(),

          home: Login_Page(),
        );
      })
    );
  }
}


