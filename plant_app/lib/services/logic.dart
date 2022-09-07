import 'package:cloud_firestore/cloud_firestore.dart';

class LogicService {
  final today = DateTime.now();

  Timestamp nextWater(int consistency) {
    Timestamp newDate =
        Timestamp.fromDate(today.add(Duration(days: consistency)));

    return newDate;
  }

  
}
