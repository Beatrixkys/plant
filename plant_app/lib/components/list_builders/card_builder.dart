import 'package:flutter/material.dart';
import 'package:plant_app/components/cards.dart';
import 'package:plant_app/model/plant_model.dart';

class PlantList extends StatefulWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  List<PlantsData> plants = [
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
    PlantsData(name: "Alfred", wateramount: 50),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return PlantsCard(plant: plants[index]);
      },
      itemCount: plants.length,
    );
  }
}
