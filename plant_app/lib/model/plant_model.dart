import 'package:cloud_firestore/cloud_firestore.dart';

class PlantsData {
  String plantid;
  String name;
  int amount;
  int consistency;
  List waterHistory;
  Timestamp nextDate;

  PlantsData({
    required this.plantid,
    required this.name,
    required this.amount,
    required this.consistency,
    required this.waterHistory,
    required this.nextDate,
  });
}
