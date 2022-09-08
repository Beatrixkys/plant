import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/components/list_builders/card_builder.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/screens/settings_screen.dart';
import 'package:plant_app/services/database.dart';
import 'package:provider/provider.dart';

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
  final screens = [
    const HomeScreen(),
    const AddScreen(),
    SettingsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final uid = user!.uid;
    double scrollerHeight = MediaQuery.of(context).size.height * 0.6;
    //double headerHeight = MediaQuery.of(context).size.height * 0.19;

    return StreamProvider<List<PlantsData>>.value(
      initialData: const [],
      value: DatabaseService(uid).plants,
      child: Scaffold(
        body: Column(
          children: [
            const MyHeader(
                title: 'Water your Plants Bitch, \n They Thirstier Than You'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: scrollerHeight,
              child: PlantList(uid: uid),
            )
          ],
        ),
      ),
    );
  }
}
