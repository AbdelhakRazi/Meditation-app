import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';
import 'package:meditation_app/Different_size.dart';
import 'package:meditation_app/HomeAndLanding/ButtonClass.dart';

class Landing extends StatefulWidget {
  @override
  final Function switchlanding;
  final Function switchscreen;
  Landing({this.switchlanding, this.switchscreen});
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  bool showLanding = true;
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3E606F),
                Color(0xFF193441),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            runSpacing: 40,
            children: <Widget>[
              FadeAnimation(
                1,
                Text('calmatic',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 22,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              FadeAnimation(
                  1,
                  new Image.asset(
                    'assets/illustration.png',
                    height: MediaQuery.of(context).size.height / 3.5,
                  )),
              SizedBox(height: MediaQuery.of(context).size.height / 12.8),
              FadeAnimation(
                1.2,
                Text('Welcome',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 21.33)),
              ),
              FadeAnimation(
                1.2,
                Center(
                  child: Text(
                      'Feel each flow in your body\nLet your mind be more comfortable',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'nexa',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 19)),
                ),
              ),
              FadeAnimation(
                1.8,
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 1.56,
                  height: MediaQuery.of(context).size.height / 15.6,
                  child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Color(0xFF193441),
                          fontFamily: "nexa",
                          fontSize: 2.5 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        widget.switchlanding();
                      }),
                ),
              ),
              AuthButton(
                  switchlanding: widget.switchlanding,
                  switchscreen: widget.switchscreen,
                  texttheme: 'Join Now'),
            ],
          ),
        ),
      ),
    );
  }
}
