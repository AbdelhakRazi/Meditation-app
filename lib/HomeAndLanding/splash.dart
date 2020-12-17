import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';

class Splosh extends StatefulWidget {
  @override
  _SploshState createState() => _SploshState();
}

class _SploshState extends State<Splosh> {
  @override
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
        child: FadeAnimation(
          0.5,
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
                Transform.rotate(
                  angle: 26,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Transform.rotate(
                        angle: -26,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/1x/logobleu.png')),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 17.29,
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Text('calmatic',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 15.28,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
