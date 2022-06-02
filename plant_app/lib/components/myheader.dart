import 'package:flutter/cupertino.dart';
import 'package:plant_app/constant.dart';

class MyHeader extends StatelessWidget {
  final String title;

  const MyHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height * 0.19;

    return SizedBox(
      height: headerHeight,
      child: Center(child: Text(title, style: kHeadingTextStyle)),
    );
  }
}
