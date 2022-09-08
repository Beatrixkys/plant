import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/constant.dart';

import '../model/user_model.dart';

import '../services/database.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
    Key? key,
  }) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final uid = user!.uid;

    MyUserData? userData;

    Stream<MyUserData?> myUserData = DatabaseService(uid).user;
    return Scaffold(
      body: Column(
        children: [
          const MyHeader(title: 'Update Your Settings'),
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 50,
            child: StreamBuilder<MyUserData?>(
              stream: myUserData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  userData = snapshot.data;
                  var value = userData!.name;
                  return Text(
                    value,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          //insert sized box then list view
          smallSpace,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text(
                    'Profile Settings',
                    style: kTitleTextStyle,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text(
                    'Notifications Settings',
                    style: kTitleTextStyle,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text(
                    'Log Out',
                    style: kTitleTextStyle,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text(
                    'Log In To Test',
                    style: kTitleTextStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
