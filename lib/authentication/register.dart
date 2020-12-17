import 'package:flutter/material.dart';
import 'package:meditation_app/Different_size.dart';
import 'package:meditation_app/authentication/AuthExcpetionHandler.dart';
import 'package:meditation_app/authentication/auth.dart';
import 'package:meditation_app/my_flutter_app_icons.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';
import 'package:meditation_app/HomeAndLanding/splash.dart';

class Register extends StatefulWidget {
  @override
  final Function switchscreen;
  Register({this.switchscreen});
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Authentication _auth = Authentication();

  FocusNode nodeuser = FocusNode();
  FocusNode nodeemail = FocusNode();
  FocusNode nodepass = FocusNode();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email;
  String _password;
  String usernme;
  bool showpass = true;
  bool loading = false;
  IconData mogh = MyFlutterApp.eye_off;
  Widget build(BuildContext context) {
    return loading
        ? Splosh()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                                text: 'Let us meditate together',
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
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 30,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                focusNode: nodeuser,
                                onFieldSubmitted: (value) {
                                  nodeuser.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(nodeemail);
                                },
                                cursorRadius: Radius.elliptical(5, 5),
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  fontFamily: "nexa",
                                  fontWeight: FontWeight.bold,
                                ),
                                validator: (value) =>
                                    value.isEmpty ? "Name is required" : null,
                                keyboardType: TextInputType.emailAddress,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  hintText: "Enter username",
                                  hintStyle: TextStyle(
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    fontFamily: "nexa",
                                    color: Color(0xFF91AA9D),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  errorStyle: TextStyle(
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[400]),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 15,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.account_circle,
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
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    usernme = value;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                focusNode: nodeemail,
                                onFieldSubmitted: (value) {
                                  nodeemail.unfocus();
                                  FocusScope.of(context).requestFocus(nodepass);
                                },
                                cursorRadius: Radius.elliptical(5, 5),
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  fontFamily: "nexa",
                                  fontWeight: FontWeight.bold,
                                ),
                                validator: (value) {
                                  value.isEmpty ? "Email is required" : null;
                                  if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email Address';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  hintText: "Enter email",
                                  hintStyle: TextStyle(
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    fontFamily: "nexa",
                                    color: Color(0xFF91AA9D),
                                    fontWeight: FontWeight.normal,
                                  ),
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
                                ),
                                onChanged: (value) {
                                  _email = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                focusNode: nodepass,
                                onFieldSubmitted: (value) {
                                  nodeuser.unfocus();
                                },
                                cursorRadius: Radius.elliptical(5, 5),
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2 * SizeConfig.textMultiplier,
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
                                  hintText: "Enter password",
                                  hintStyle: TextStyle(
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    fontFamily: "nexa",
                                    color: Color(0xFF91AA9D),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      mogh,
                                      color: Colors.white,
                                    ),
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
                                  ),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
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
                                  errorStyle: TextStyle(
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[400]),
                                ),
                              ),
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
                                    'Create account',
                                    style: TextStyle(
                                      color: Color(0xFF193441),
                                      fontFamily: "nexa",
                                      fontSize: 2.5 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    if (_formkey.currentState.validate()) {
                                      dynamic result = await _auth.registerIn(
                                          _email, _password, usernme);
                                      if (result !=
                                          AuthResultStatus.successful) {
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF193441)),
                                                ),
                                              );
                                            });
                                      }
                                    }
                                  }),
                            ),
                            GestureDetector(
                              onTap: () => widget.switchscreen(),
                              child: Text('Already have an account? Log in',
                                  style: TextStyle(
                                    fontSize: 2 * SizeConfig.textMultiplier,
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
