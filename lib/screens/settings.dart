 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../shared/them/ThemModel.dart';
import 'EditProfile.dart';
import 'Profile.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:( context,ThemModel themeNotifier,child){
        return Scaffold(
        body: SettingsList(
          contentPadding: EdgeInsets.all(5.0),
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
                  leading: Icon(Icons.edit,color: Colors.deepPurple,size: 25.0,),
                  title: Text('Edit Profile'),
                  onPressed: (context){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>EditProfile())
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.logout,color: Colors.redAccent,size: 25.0,),
                  title: Text('Sign Out'),
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



                ),

                SettingsTile.navigation(
                  leading: Icon(Icons.contacts_outlined,color: Colors.deepOrange,size: 25.0,),
                  title: Text('Contact Us'),



                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.contact_support_outlined,color: Colors.deepPurple,size: 25.0,),
                  title: Text('Terms and Conditions'),
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
