import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';

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
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 10),
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
            SizedBox(height: MediaQuery.of(context).size.height / 10.8),
            FadeAnimation(
                1,
                new Image.asset(
                  'assets/illustration.png',
                  height: MediaQuery.of(context).size.height / 3.5,
                )),
            SizedBox(height: MediaQuery.of(context).size.height / 12.8),
            FadeAnimation(
              1.2,
              Align(
                alignment: Alignment(0, 0),
                child: Text('Welcome',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 21.33)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            FadeAnimation(
              1.2,
              Align(
                alignment: Alignment(0, 0),
                child: Text('Feel each flow in your body',
                    style: TextStyle(
                        fontFamily: 'nexa',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).size.height / 40)),
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: FadeAnimation(
                1.2,
                Text('Let your mind be more comfortable',
                    style: TextStyle(
                        fontFamily: 'nexa',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).size.height / 40)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25.6),
            FadeAnimation(
              1.3,
              Align(
                alignment: Alignment(0, 0),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 1.56,
                  height: MediaQuery.of(context).size.height / 15.6,
                  child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Color(0xFF193441),
                          fontFamily: "nexa",
                          fontSize: MediaQuery.of(context).size.height / 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        widget.switchlanding();
                      }),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 29.09),
            FadeAnimation(
              1.8,
              Align(
                alignment: Alignment(0, 0),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 1.56,
                  height: MediaQuery.of(context).size.height / 15.6,
                  child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        'Join now',
                        style: TextStyle(
                          color: Color(0xFF193441),
                          fontFamily: "nexa",
                          fontSize: MediaQuery.of(context).size.height / 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        widget.switchscreen();
                        widget.switchlanding();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
