import 'package:flutter/material.dart';
import 'package:plant_app/components/theme_button.dart';
import 'package:plant_app/screens/add_screen.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/screens/settings_screen.dart';
import 'package:plant_app/services/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final _screens = [
    const HomeScreen(),
    const AddScreen(),
    const SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemesProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemesProvider>(context);
          return MaterialApp(
            title: "Weedify",
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: Scaffold(
              appBar: AppBar(
                actions: const [ChangeThemeButton()],
              ),
              body: _screens[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                showUnselectedLabels: false,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
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
            ),
          );
        });
  }
}
