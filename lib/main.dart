import '../provider/auth_provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:ttttt/provider/auth_provider.dart';
import 'package:ttttt/shared/them/ThemModel.dart';
import 'layouts/home_screen.dart';
import 'modules/login/login_page.dart';
import 'modules/pageview/list.dart';
import 'modules/splachscreen/SplachScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider(),
      ),


    ],
      child: MyApp() ,
    ),
  );
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

          home: _showScreen(context),
        );
      })
    );
  }
  Widget _showScreen(context) {
    var prov = Provider.of<AuthProvider>(context);
    switch(prov.authStatus){
      case AuthStatus.authenticating:
        return Login_Page();
      case AuthStatus.unAuthenticated:
        return SplashScreen();
      case AuthStatus.authenticated:
        return HomeScreen();
    }
    return Container();

    throw UnimplementedError();
  }
}


