import 'package:flutter/material.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/constant.dart';
import 'package:plant_app/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyHeader(title: 'Update Your Settings'),
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text("UserName"),
            radius: 50,
          ),
          //insert sized box then list view
          smallSpace,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
