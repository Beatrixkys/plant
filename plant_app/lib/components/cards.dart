import 'package:flutter/material.dart';
import 'package:plant_app/model/plant_model.dart';

class PlantsCard extends StatelessWidget {
  final PlantsData plant;

  const PlantsCard({
    Key? key,
    required this.plant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(15),
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: const Color(0xFFE5E5E5),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.asset("assets/plant.png", height: 40),
            Text(
              plant.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ('${plant.wateramount} ml'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
