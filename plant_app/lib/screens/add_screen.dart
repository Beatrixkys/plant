import 'package:flutter/material.dart';
import 'package:plant_app/components/list_builders/card_builder.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    double scrollerHeight = MediaQuery.of(context).size.height * 0.6;
    double headerHeight = MediaQuery.of(context).size.height * 0.2;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: headerHeight,
            child: Center(
                child: Text(
                    'Water your Plants Bitch, \n They Thirstier Than You')),
          ),
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
