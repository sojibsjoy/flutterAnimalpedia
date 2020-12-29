import 'package:animalpedia/Screens/Welcome/welcome_screen.dart';
import 'package:animalpedia/Screens/authenticate.dart';
import 'package:animalpedia/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/drawerScreen.dart';
import 'Screens/homeScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either profile or user setup screen
    if (user == null) {
      return Authenticate();
    } else {
      return Scaffold(
        body: Stack(
          children: [DrawerScreen(), HomeScreen()],
        ),
      );
    }
  }
}
