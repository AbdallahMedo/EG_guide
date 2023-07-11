 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:ttttt/screens/ApoutUs.dart';

import '../modules/login/login_page.dart';
import '../provider/auth_provider.dart';
import '../shared/them/ThemModel.dart';
import 'Conditions.dart';
import 'Profile.dart';
import 'language.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  FirebaseAuth instance=FirebaseAuth.instance;
  @override
  // initState() {
  //   super.initState();
  //   instance.authStateChanges().listen((User? user) {
  //     if(user== instance.signOut()){
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context)=>Login_Page()));
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AuthProvider>(context);
    return Consumer(
      builder:( context,ThemModel themeNotifier,child){
        return Scaffold(
        body: SettingsList(
          //contentPadding: EdgeInsets.all(1.0),
          shrinkWrap: true,
          sections: [
            SettingsSection(
              title: Text(
                'Account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0

                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.account_circle,color: Colors.purple,size: 25.0,),
                  title: Text('Your Account'),
                  onPressed: (contxt){
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context)=>Profile())
                        );
                  },




                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.logout,color: Colors.redAccent,size: 25.0,),
                  title: Text('Sign Out'),

                  onPressed: (context){


                    prov.logout();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Page()));
                  },
                ),

              ],
            ),
            SettingsSection(
              title: Text(
                'Appearance',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0

                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  onToggle: (value) {
                    themeNotifier.isDark
                        ?themeNotifier.isDark=false
                        :themeNotifier.isDark=true;
                  },

                  initialValue:themeNotifier.isDark? true:false,
                  leading: Icon(CupertinoIcons.moon_stars_fill,size: 25.0,color: Colors.amber,),
                  title: Text('Dark Mode'),


                ),
              ],
            ),
            SettingsSection(
              title: Text(
                'Common',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0

                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language,color: Colors.lightBlueAccent,size: 25.0,),
                  title: Text('Language'),
                  onPressed: (contxt){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(contxt)=>LanguageSwtch())
                    );
                  },



                ),

                SettingsTile.navigation(
                  leading: Icon(Icons.contacts_outlined,color: Colors.deepOrange,size: 25.0,),
                  title: Text('Contact Us'),




                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.contact_support_outlined,color: Colors.deepPurple,size: 25.0,),
                  title: Text('Terms and Conditions'),
                  onPressed: (context){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(contxt)=>Conditions())
                    );

                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.info_outline_rounded,color: Colors.black,size: 25.0,),
                  title: Text('AboutUs'),
                  onPressed: (context){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(contxt)=>About_Us())
                    );

                  },
                ),

              ],
            ),

          ],
        ),
        );
      },

    );
  }

}
