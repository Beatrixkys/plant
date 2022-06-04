import 'package:flutter/material.dart';
import 'package:plant_app/constant.dart';
import 'package:async/async.dart';

class WaterPopUp extends StatelessWidget {
  const WaterPopUp({Key? key}) : super(key: key);

//use the back part to reset the plant water state to 0 
  void restartTimer() {
    RestartableTimer timer = RestartableTimer(const Duration(days: 5), () {});
    timer.reset();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: (Text(
          'Water Me!',
          style: kTitleTextStyle,
        )),
      ),
      content: Image.asset("assets/plant.png", height: 150),
      actions: [
        Center(
          child: IconButton(
            onPressed: () {
              restartTimer(); 
            },
            icon: Icon(Icons.water_drop),
            iconSize: 50,
          ),
        )
      ],
    );
  }
}
