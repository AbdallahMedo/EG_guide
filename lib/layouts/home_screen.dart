import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../modules/firstmap/Test_Map.dart';
import '../screens/settings.dart';

class HomeScreen extends StatefulWidget {
   //HomeScreen(User? user, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //FirebaseAuth instance=FirebaseAuth.instance;

  int currentIndex=0 ;
  final _buildBody=<Widget>[mapsscreen(),Setting()];
  // late Widget _selectedWidget;

  @override
  void initState() {
    currentIndex=0;
    // _selectedWidget = mapsscreen();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _buildBody[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
       selectedItemColor: Colors.blueAccent,
        onTap:(x){
         setState(() {
           currentIndex=x;
         });
        },
        items: [
          BottomNavigationBarItem(
            label:'Home',
              icon: Icon(Icons.home),
           // backgroundColor: Colors.lightBlue,

          ),
          BottomNavigationBarItem(
            label: "Settings",
              icon: Icon(Icons.settings),
          ),
        ],

      ),
    );
  }

  // void onPressed(index) {
  //   setState(() {
  //     currentIndex = index;
  //     if (index == 0) {
  //       _selectedWidget = mapsscreen();
  //     }
  //     if (index == 1) {
  //       _selectedWidget = Setting();
  //     }
  //   });
  // }

}
