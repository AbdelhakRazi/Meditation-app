import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    this.switchlanding,
    @required this.switchscreen,
    @required this.texttheme,
  });

  final Function switchlanding;
  final Function switchscreen;
  final String texttheme;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.8,
      ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 1.56,
        height: MediaQuery.of(context).size.height / 15.6,
        child: RaisedButton(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Text(
              texttheme,
              style: TextStyle(
                color: Color(0xFF193441),
                fontFamily: "nexa",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.white,
            onPressed: () {
              switchscreen();
              switchlanding();
            }),
      ),
    );
  }
}
