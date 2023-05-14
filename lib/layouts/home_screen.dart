import 'package:flutter/material.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import '../modules/firstmap/Test_Map.dart';
import '../screens/home.dart';
import '../screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  late Widget _selectedWidget;

  @override
  void initState() {
    _selectedWidget = mapsscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedWidget,
      bottomNavigationBar: DiamondBottomNavigation(
        itemIcons: const [Icons.home, Icons.settings],
        centerIcon: Icons.place,
        selectedIndex: currentIndex,
        onItemPressed: onPressed,

      ),
    );
  }

  void onPressed(index) {
    setState(() {
      currentIndex = index;
      if (index == 0) {
        _selectedWidget = const Home();
      } else if (index == 1) {
        _selectedWidget =  mapsscreen();
      } else if (index == 2) {
        _selectedWidget = const Setting();
      }
    });
  }
}
