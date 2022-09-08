import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/plant_model.dart';
import '../model/user_model.dart';

class DatabaseService {
  final String uid;
  Timestamp today = Timestamp.now();

  DatabaseService(this.uid);

  //collection to store the users
  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference<Map<String, dynamic>> plantsCollection =
      FirebaseFirestore.instance.collection("plant");

  Future<void> saveUser(String name, String email) async {
    //doc will create a new uid of Database service
    return await userCollection.doc(uid).set({'name': name, 'email': email});
  }

  Future<void> updateUser(String? name, String? email) async {
    return await userCollection.doc(uid).update({'name': name, 'email': email});
  }

  MyUserData _userFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return MyUserData(
      uid: snapshot.id,
      name: data['name'],
      email: data['email'],
    );
  }

//Create a SINGLE user stream
  //stream qui récupre le user courant donc
  // besoin de doc(uid)
  Stream<MyUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  Future<void> addPlant(String name, int amount, int consistency) async {
    //doc will create a new uid of Database service
    return await plantsCollection
        .doc(uid)
        .collection('plantsdetails')
        .doc()
        .set({
      'name': name,
      'amount': amount,
      'consistency': consistency,
      'dates': [today],
    });
  }

  List<PlantsData> _plantsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PlantsData(
        plantid: doc.id,
        amount: (doc.data() as dynamic)['amount'] ?? 0,
        consistency: (doc.data() as dynamic)['consistency'] ?? 0,
        waterHistory: (doc.data() as dynamic)['waterHistory'] ?? [],
        name: (doc.data() as dynamic)['name'] ?? '',
        nextDate: (doc.data() as dynamic)['enddate'] ?? Timestamp.now(),
      );
    }).toList();
  }

  Stream<List<PlantsData>> get plants {
    final CollectionReference<Map<String, dynamic>> plantsdetailsCollection =
        plantsCollection.doc(uid).collection("plantsdetails");

    return plantsdetailsCollection.snapshots().map(_plantsListFromSnapshot);
  }

  Future<void> updatePlantHistory(Timestamp nextDate, String docid) async {
    Timestamp date = Timestamp.now();

    return await plantsCollection
        .doc(uid)
        .collection("plantsdetails")
        .doc(docid)
        .update({
      'dates': FieldValue.arrayUnion([date]),
      'nextDate': nextDate,
    });
  }
}
