import 'package:animalpedia/models/user.dart';
import 'package:animalpedia/services/auth.dart';
import 'package:animalpedia/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        theme: ThemeData(fontFamily: 'Circular'),
      ),
    );
  }
}
