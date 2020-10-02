import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/authentication/AuthenticationFiles.dart';
import 'package:meditation_app/HomeAndLanding/HomePage.dart';
import 'package:provider/provider.dart';

class ChooseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user == null) {
      return AuthenticationFiles();
    } else {
      return SecondTab();
    }
  }
}
