import 'package:flutter/material.dart';
import 'package:meditation_app/authentication/AuthExcpetionHandler.dart';
import 'dart:core';
import 'package:meditation_app/authentication/auth.dart';
import 'package:meditation_app/authentication/register.dart';
import 'package:meditation_app/my_flutter_app_icons.dart';
import 'package:meditation_app/HomeAndLanding/splash.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';

class Login extends StatefulWidget {
  @override
  final Function switchscreen;
  Login({this.switchscreen});
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final Authentication _auth = Authentication();
  FocusNode _nodeone = FocusNode();
  FocusNode nodetwo = FocusNode();
  bool showpass = true;
  IconData mogh = MyFlutterApp.eye_off;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email;
  String changemail;
  String _password;
  bool loading = false;
  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return loading
        ? Splosh()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FadeAnimation(
                      1.0,
                      Transform.rotate(
                        angle: 26,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 9.01,
                          width: MediaQuery.of(context).size.width / 5.29,
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
                                      image:
                                          AssetImage('assets/1x/logobleu.png')),
                                ),
                              )),
                        ),
                      ),
                    ),
                    FadeAnimation(
                        1.2,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'calmatic\n',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height /
                                      15.28,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            TextSpan(
                                text: 'Improve your day now',
                                style: TextStyle(
                                  fontFamily: "nexa",
                                  fontSize:
                                      MediaQuery.of(context).size.height / 43,
                                  color: Colors.white,
                                )),
                          ]),
                        )),
                    FadeAnimation(
                      1.4,
                      Form(
                        key: _formkey,
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          runSpacing: 30,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                onFieldSubmitted: (term) {
                                  _nodeone.unfocus();
                                  FocusScope.of(context).requestFocus(nodetwo);
                                },
                                focusNode: _nodeone,
                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                cursorRadius: Radius.elliptical(5, 5),
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: "nexa",
                                  fontWeight: FontWeight.bold,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Email is required";
                                  }

                                  if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email Address';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[400]),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 15,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height /
                                        27.82,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintText: "Enter email",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "nexa",
                                    color: Color(0xFF91AA9D),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onChanged: (value) {
                                  _email = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                focusNode: nodetwo,
                                textInputAction: TextInputAction.done,
                                cursorRadius: Radius.elliptical(5, 5),
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: "nexa",
                                  fontWeight: FontWeight.bold,
                                ),
                                obscureText: showpass,
                                validator: (value) => value.length < 6
                                    ? "Password too short"
                                    : null,
                                onChanged: (value) {
                                  _password = value;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 15,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height /
                                        27.82,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showpass = !showpass;
                                      });
                                      if (showpass == true) {
                                        setState(() {
                                          mogh = MyFlutterApp.eye_off;
                                        });
                                      } else {
                                        setState(() {
                                          mogh = Icons.remove_red_eye;
                                        });
                                      }
                                      print(showpass);
                                    },
                                    icon: Icon(
                                      mogh,
                                      size: MediaQuery.of(context).size.height /
                                          27.82,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: "Enter password",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "nexa",
                                    color: Color(0xFF91AA9D),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  errorStyle: TextStyle(
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[400]),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: false,
                                        actions: [
                                          FlatButton(
                                              onPressed: () async {
                                                dynamic res =
                                                    await Authentication()
                                                        .changepassword(
                                                            changemail);
                                                if (res !=
                                                    AuthResultStatus
                                                        .successful) {
                                                  String errorMsg =
                                                      AuthExceptionHandler
                                                          .generateExceptionMessage(
                                                              res);
                                                  return showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          actions: [
                                                            FlatButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // dismiss dialog
                                                                },
                                                                child: Text(
                                                                  'Retry',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "nexa",
                                                                      fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          37.64,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xFF193441)),
                                                                )),
                                                          ],
                                                          content: Text(
                                                            errorMsg,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "nexa",
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    37.64,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xFF193441)),
                                                          ),
                                                        );
                                                      });
                                                } else {
                                                  return showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          actions: [
                                                            FlatButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // dismiss dialog
                                                                },
                                                                child: Text(
                                                                  'OK',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "nexa",
                                                                      fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .height /
                                                                          37.64,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xFF193441)),
                                                                )),
                                                          ],
                                                          content: Text(
                                                            'Check ur mail',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "nexa",
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    37.64,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xFF193441)),
                                                          ),
                                                        );
                                                      });
                                                }
                                                // dismiss dialog
                                              },
                                              child: Text(
                                                'Send Recovery mail',
                                                style: TextStyle(
                                                    fontFamily: "nexa",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            37.64,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF193441)),
                                              )),
                                        ],
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Enter your email',
                                              style: TextStyle(
                                                  fontFamily: "nexa",
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          37.64,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF193441)),
                                            ),
                                            TextField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: (value) {
                                                changemail = value;
                                              },
                                              style: TextStyle(
                                                  fontFamily: "nexa",
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          37.64,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF193441)),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Text('Forgot your password? Click here',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "nexa",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                            ButtonTheme(
                              minWidth:
                                  MediaQuery.of(context).size.width / 1.56,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Colors.white,
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result =
                                        await _auth.signin(_email, _password);
                                    print(result);
                                    if (result != AuthResultStatus.successful) {
                                      setState(() {
                                        loading = false;
                                      });
                                      String errorMsg = AuthExceptionHandler
                                          .generateExceptionMessage(result);
                                      return showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // dismiss dialog
                                                    },
                                                    child: Text(
                                                      'Retry',
                                                      style: TextStyle(
                                                          fontFamily: "nexa",
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              37.64,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFF193441)),
                                                    )),
                                              ],
                                              content: Text(
                                                errorMsg,
                                                style: TextStyle(
                                                    fontFamily: "nexa",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            37.64,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF193441)),
                                              ),
                                            );
                                          });
                                    }
                                  }
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () => widget.switchscreen(),
                              child: Text('Not a member? Join now',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "nexa",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
