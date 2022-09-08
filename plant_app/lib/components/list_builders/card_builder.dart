import 'package:flutter/material.dart';
import 'package:plant_app/components/cards.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:provider/provider.dart';

class PlantList extends StatefulWidget {
  final String uid;
  const PlantList({Key? key, required this.uid}) : super(key: key);

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  @override
  Widget build(BuildContext context) {
    final plants = Provider.of<List<PlantsData>>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return PlantsCard(
          plant: plants[index],
          uid: widget.uid,
        );
      },
      itemCount: plants.length,
    );
  }
}

class DateList extends StatelessWidget {
  final List dates;
  const DateList({Key? key, required this.dates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text((dates[index].toString())),
        );
      },
      itemCount: dates.length,
    );
  }
}
