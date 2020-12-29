import 'package:animalpedia/Screens/Signup/background.dart';
import 'package:animalpedia/components/rounded_button.dart';
import 'package:animalpedia/components/rounded_input_field.dart';
import 'package:animalpedia/components/rounded_password_field.dart';
import 'package:animalpedia/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animalpedia/constants.dart';

class WelcomeScreen extends StatefulWidget {
  final Function toggleView;
  WelcomeScreen({this.toggleView});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  " Welcome to Anmalpedia\nPlease Login / signup first",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    print(email);
                    print(password);
                    // dynamic result = await _auth.signInAnon();
                    // if (result == null) {
                    //   print('error singing in');
                    // } else {
                    //   print('Signed in');
                    //   print(result.uid);
                    // }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an Account ? ",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
