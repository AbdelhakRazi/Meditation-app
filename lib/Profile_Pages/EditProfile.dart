import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditation_app/active%20pages/Backend.dart';
import 'package:meditation_app/my_flutter_app_icons.dart';
import 'package:meditation_app/Profile_Pages/ProfilePage.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/Animation/fadetransition.dart';
import "dart:io";

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  final picker = ImagePicker();
  Future fromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedFile.path);
    });
    return image;
  }

  Future fromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile.path);
    });
    return image;
  }

  bool showpass = false;
  File image;
  IconData mogh = MyFlutterApp.eye_off;
  String _email, _name, _password;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return StreamBuilder<UserData>(
        stream: CreateData(uid: user.uid).datastream,
        builder: (context, snapshot) {
          UserData userdata = snapshot.data;
          return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                title: FadeAnimation(
                  1.0,
                  Text('Edit your Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height / 30.55)),
                ),
              ),
              extendBodyBehindAppBar: true,
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
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 8),
                        FadeAnimation(
                          1.2,
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 6.73,
                            backgroundColor: Colors.white,
                            backgroundImage: userdata.url != null
                                ? CachedNetworkImageProvider(
                                    userdata.url,
                                  )
                                : AssetImage('assets/illustration.png'),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 54),
                        FadeAnimation(
                          1.2,
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bc) {
                                  return SafeArea(
                                    child: Container(
                                      child: new Wrap(
                                        children: <Widget>[
                                          new ListTile(
                                              leading:
                                                  new Icon(Icons.photo_library),
                                              title: new Text('Gallery'),
                                              onTap: () async {
                                                await fromGallery();
                                                if (image != null) {
                                                  /* if (userdata.url != null) {
                                                    await CreateData(
                                                            uid: user.uid)
                                                        .deleteImage(user.uid);
                                                    await CreateData(
                                                            uid: user.uid)
                                                        .uploadImage(image);
                                                  } else*/
                                                  {
                                                    await CreateData(
                                                            uid: user.uid)
                                                        .uploadImage(image,
                                                            userdata.name);
                                                  }
                                                }
                                                Navigator.of(context).pop();
                                              }),
                                          new ListTile(
                                            leading:
                                                new Icon(Icons.photo_camera),
                                            title: new Text('Camera'),
                                            onTap: () async {
                                              await fromCamera();
                                              if (image != null) {
                                                await CreateData(uid: user.uid)
                                                    .uploadImage(
                                                        image, userdata.name);
                                              }
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text('UPLOAD PICTURE',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            35.55)),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 14),
                        FadeAnimation(
                          1.4,
                          Form(
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(34.00, 0, 22.00, 0),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    cursorRadius: Radius.elliptical(5, 5),
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              37.64,
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      alignLabelWithHint: true,
                                      hintText: userdata.name,
                                      hintStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                37.64,
                                        fontFamily: "nexa",
                                        color: Color(0xFF91AA9D),
                                        fontWeight: FontWeight.bold,
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
                                        size:
                                            MediaQuery.of(context).size.height /
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
                                        _name = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(34.00, 0, 22.00, 0),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    cursorRadius: Radius.elliptical(5, 5),
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              37.64,
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    validator: (value) {
                                      value.isEmpty
                                          ? "Email is required"
                                          : null;
                                      if (!RegExp(
                                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email Address';
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      hintText: user.email,
                                      hintStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                37.64,
                                        fontFamily: "nexa",
                                        color: Color(0xFF91AA9D),
                                        fontWeight: FontWeight.bold,
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
                                        size:
                                            MediaQuery.of(context).size.height /
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
                                        _email = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        18),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(34.00, 0, 22.00, 0),
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    cursorRadius: Radius.elliptical(5, 5),
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              37.64,
                                      fontFamily: "nexa",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    obscureText: showpass,
                                    validator: (value) => value.length < 6
                                        ? "Password too short"
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        _password = value;
                                      });
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                37.64,
                                        fontFamily: "nexa",
                                        color: Color(0xFF91AA9D),
                                        fontWeight: FontWeight.bold,
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
                                        size:
                                            MediaQuery.of(context).size.height /
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
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        25.33),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(34.00, 0, 22.00, 0),
                                  child: ButtonTheme(
                                    minWidth:
                                        MediaQuery.of(context).size.width /
                                            1.56,
                                    height: MediaQuery.of(context).size.height /
                                        15.6,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Color(0xFF193441),
                                            fontFamily: "nexa",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        color: Colors.white,
                                        onPressed: () async {
                                          if (_name == null) {
                                            await CreateData(uid: user.uid)
                                                .adduser(userdata.name,
                                                    userdata.url);

                                            Navigator.push(context,
                                                FadeRoute(page: ProfileTab()));
                                          }
                                          if (_name != null) {
                                            await CreateData(uid: user.uid)
                                                .adduser(_name, userdata.url);

                                            Navigator.push(context,
                                                FadeRoute(page: ProfileTab()));
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ));
        });
  }
}
