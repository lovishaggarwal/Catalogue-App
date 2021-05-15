import 'package:auto_size_text/auto_size_text.dart';
import 'package:catalogue_app/utils/constants.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool onChanged = false;

  final _formKey = GlobalKey<FormState>();

  moveToNextScreen(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        onChanged = true;
      });
      await Future.delayed(Duration(milliseconds: 600));
      await Navigator.pushNamed(context, Routes.homeRoute);
      setState(() {
        onChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/login1.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                AutoSizeText(
                  'Welcome',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Username',
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (value.length < 6) {
                            return 'Password should be atleast 6 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => moveToNextScreen(context),
                  child: AnimatedContainer(
                    height: 50,
                    width: onChanged ? 50 : 140,
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                      color: customRed,
                      borderRadius: BorderRadius.circular(onChanged ? 25 : 8),
                    ),
                    child: onChanged
                        ? Icon(Icons.done, color: Colors.white)
                        : Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.9,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
