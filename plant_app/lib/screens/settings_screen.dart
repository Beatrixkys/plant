import 'package:flutter/material.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyHeader(title: 'Update Your Settings'),
          //insert listview
        ],
      ),
    );
  }
}
