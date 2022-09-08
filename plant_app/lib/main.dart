import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/screens/auth_screen.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/services/auth.dart';
import 'package:plant_app/services/themes.dart';
import 'package:provider/provider.dart';

import 'model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
//TODO!
//1. Separate the scaffold into another screen and port the screens component in
//2. create initial routing to said widget
//3. initialise firebase in personal email
//4. create provider conditions
//5. finish login linking with forms

//1. Refer fyp 2 for the themes provider
//move scaffold to another page

//Test by totalling the amounts from the array

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: ChangeNotifierProvider(
          create: (context) => ThemesProvider(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemesProvider>(context);
            return MaterialApp(
              title: "Weedify",
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              initialRoute: '/',
              routes: {
                '/': (context) => const AuthScreen(),
                '/home': (context) =>
                    const AppBase(uid: "YShRjJui0UNWZfNCSEf7GVyvmWr2"),
              },
            );
          }),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    if (user == null) {
      return const AuthScreen();
    } else {
      return AppBase(uid: user.uid);
    }
  }
}
