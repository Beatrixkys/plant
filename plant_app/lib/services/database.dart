import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  //collection to store the users
  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String name, String email) async {
    //doc will create a new uid of Database service
    return await userCollection.doc(uid).set({'name': name, 'email': email});
  }

  Future<void> updateUser(String? name, String? email) async {
    return await userCollection.doc(uid).update({'name': name, 'email': email});
  }
}
