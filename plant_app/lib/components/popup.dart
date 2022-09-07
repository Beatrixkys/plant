import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/components/list_builders/card_builder.dart';
import 'package:plant_app/constant.dart';
import 'package:plant_app/services/database.dart';

import '../services/logic.dart';

class WaterPopUp extends StatelessWidget {
  final List waterHistory;
  final int amount;
  final String docid;
  final String userid; 

  const WaterPopUp(
      {Key? key,
      required this.waterHistory,
      required this.amount,
      required this.docid, required this.userid})
      : super(key: key);

//use the back part to reset the plant

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: (Text(
          'Water Me!',
          style: kTitleTextStyle,
        )),
      ),
      content: Column(
        children: [
          Image.asset("assets/plant.png", height: 150),
          DateList(dates: waterHistory),
        ],
      ),
      actions: [
        Center(
          child: IconButton(
            onPressed: () {
              Timestamp nextWaterDate = LogicService().nextWater(amount);
              DatabaseService(userid)
                  .updatePlantHistory(nextWaterDate, docid);
            },
            icon: const Icon(Icons.water_drop),
            iconSize: 50,
          ),
        )
      ],
    );
  }
}
