import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/authentication/login.dart';
import 'package:meditation_app/authentication/register.dart';
import 'package:meditation_app/HomeAndLanding/landing.dart';
import 'package:provider/provider.dart';

class AuthenticationFiles extends StatefulWidget {
  @override
  _AuthenticationFilesState createState() => _AuthenticationFilesState();
}

class _AuthenticationFilesState extends State<AuthenticationFiles> {
  @override
  bool showSignin = true;
  bool showLanding = true;
  switchscreen() {
    setState(() {
      showSignin = !showSignin;
      showLanding = false;
    });
  }

  switchlanding() {
    setState(() {
      showLanding = false;
    });
  }

  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user != null) {
      setState(() {
        showLanding = false;
      });
    }

    if (showLanding) {
      return Landing(
        switchlanding: switchlanding,
        switchscreen: switchscreen,
      );
    } else {
      if (showSignin) {
        {
          return Login(
            switchscreen: switchscreen,
          );
        }
      } else {
        return Register(
          switchscreen: switchscreen,
        );
      }
    }
  }
}
