import 'package:flutter/material.dart';
import 'package:plant_app/components/list_builders/card_builder.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            child: const PlantList(),
          )
        ],
      ),
    );
  }
}
