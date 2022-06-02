import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/components/text_field.dart';
import 'package:plant_app/constant.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String amount = '0';

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  final nameVal =
      MultiValidator([RequiredValidator(errorText: 'Field is Required')]);

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double formwidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: Column(
        children: [
          const MyHeader(title: 'Add a Plant Baby!'),
          Container(
            width: formwidth,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Form(
                child: Column(
              children: [
                RoundTextField(
                    controller: nameController,
                    title: 'Plant Name',
                    onSaved: (String? value) {
                      name != value;
                    },
                    validator: nameVal),
                space,
                RoundDoubleTextField(
                    controller: amountController,
                    title: 'Amount Water Plant Needs (ml)',
                    onSaved: (String? value) {
                      amount != value;
                    },
                    validator: nameVal),
              ],
            )),
          )
        ],
      ),
    );
  }
}
