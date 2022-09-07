import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plant_app/components/loading.dart';
import 'package:plant_app/components/myheader.dart';
import 'package:plant_app/components/text_field.dart';
import 'package:plant_app/constant.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
//Database
  //final AuthService _auth = AuthService();
  String error = '';
  String email = "";
  String password = "";
  String name = "";

//Form
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

//Validator
  final nameVal =
      MultiValidator([RequiredValidator(errorText: 'Name is Required')]);

  final emailVal = MultiValidator([
    RequiredValidator(errorText: 'Email is Required'),
    EmailValidator(errorText: 'Email must be a Valid Email')
  ]);

  final passwordVal = MultiValidator([
    RequiredValidator(errorText: 'Password is Required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 Characters')
  ]);

//Conditions
  bool showSignIn = true;
  bool loading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
      _formKey.currentState!.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      nameController.text = '';
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: Column(
            children: [
              MyHeader(title: showSignIn ? 'Sign In' : 'Register'),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (showSignIn == false)
                        (RoundTextField(
                          controller: nameController,
                          title: "Name",
                          onSaved: (String? value) {
                            name != value;
                          },
                          validator: nameVal,
                        )),
                      space,
                      RoundTextField(
                        controller: emailController,
                        title: "Email",
                        onSaved: (String? value) {
                          email != value;
                        },
                        validator: emailVal,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundTextField(
                        controller: passwordController,
                        title: "Password",
                        onSaved: (String? value) {
                          password != value;
                        },
                        validator: passwordVal,
                      ),
                      smallSpace,
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: kButtonStyle,
                              child: Text(
                                showSignIn ? 'Log In' : 'Register',
                                style: kButtonTextStyle,
                              ),
                            ),
                            const Divider(
                              height: 20.0,
                            ),
                            smallSpace,
                            ElevatedButton(
                              onPressed: () => toggleView(),
                              style: kButtonStyle,
                              child: Text(
                                showSignIn ? 'Register' : 'Sign In',
                                style: kButtonTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ));
  }
}
