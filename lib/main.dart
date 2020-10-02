import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Choosescreen.dart';
import 'package:meditation_app/authentication/auth.dart';
import 'package:meditation_app/authentication/register.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: Authentication().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChooseScreen(),
      ),
    );
  }
}
