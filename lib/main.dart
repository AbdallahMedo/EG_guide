import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttttt/screens/MarkerList.dart';
import 'package:ttttt/shared/them/ThemModel.dart';
import 'modules/firstmap/Test_Map.dart';
import 'modules/login/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // static void setLocale(BuildContext context,Locale locale){
  //   _MyAppState?  state =context.findAncestorStateOfType<_MyAppState>();
  //
  //   state?.setLocale(locale);
  //
  // }
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // Locale? _locale;
  // This widget is the root of your application.
  // void setLocale(Locale locale){
  //   setState(() {
  //     _locale=locale;
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ThemModel(),
      child:Consumer(builder: (context,ThemModel themModel,child){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themModel.isDark? ThemeData.dark():ThemeData.light(),
          // supportedLocales: [
          //   Locale('en','US'),
          //   Locale('ar','SA'),
          //
          // ],
          // locale: _locale,
          // localizationsDelegates: [
          //   DemoLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate
          // ],
          // localeResolutionCallback: (deviceLocale,supportedLocales){
          //   for(var locale in supportedLocales){
          //     if(locale.languageCode==deviceLocale?.languageCode && locale.countryCode==deviceLocale?.countryCode){
          //       return deviceLocale;
          //
          //     }
          //   }
          //   return supportedLocales.first;
          // },

          home: mapsscreen(),
        );
      })
    );
  }
}


