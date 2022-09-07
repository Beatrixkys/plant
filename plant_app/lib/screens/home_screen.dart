import 'package:flutter/material.dart';
import 'package:plant_app/components/list_builders/card_builder.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/screens/settings_screen.dart';

import '../components/theme_button.dart';
import 'add_screen.dart';

class AppBase extends StatefulWidget {
  final String uid;

  const AppBase({Key? key, required this.uid}) : super(key: key);

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(uid: widget.uid),
      AddScreen(uid: widget.uid),
      const SettingsScreen()
    ];

    return Scaffold(
      appBar: AppBar(
        actions: const [ChangeThemeButton()],
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Theme.of(context).bottomAppBarColor,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String uid;
  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double scrollerHeight = MediaQuery.of(context).size.height * 0.6;
    //double headerHeight = MediaQuery.of(context).size.height * 0.19;

    return Scaffold(
      body: Column(
        children: [
          const MyHeader(
              title: 'Water your Plants Bitch, \n They Thirstier Than You'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: scrollerHeight,
            child: PlantList(uid: widget.uid),
          )
        ],
      ),
    );
  }
}
