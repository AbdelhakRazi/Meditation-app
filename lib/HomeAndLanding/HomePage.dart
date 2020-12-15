import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meditation_app/DatabaseManagament/Backend.dart';
import 'package:meditation_app/Detail_pages/Detailed_audio_page.dart';
import 'package:meditation_app/Detail_pages/Detailed_story.dart';
import 'package:meditation_app/HomeAndLanding/ClosedAudio.dart';
import 'package:meditation_app/HomeAndLanding/Closed_story.dart';
import 'package:meditation_app/HomeAndLanding/Drawer.dart';
import 'package:meditation_app/authentication/auth.dart';
import 'package:meditation_app/my_flutter_app_icons.dart';
import 'package:animations/animations.dart';
import 'package:meditation_app/Profile_Pages/ProfilePage.dart';
import 'package:meditation_app/HomeAndLanding/splash.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';
import 'package:meditation_app/Animation/fadetransition.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/services.dart' show rootBundle;

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  List<String> time = ['5:16', '12:23', '6:25', '10:20', '3:14'];
  Authentication _auth = Authentication();

  AudioPlayer _audio;
  AudioCache _au;
  Duration _position = new Duration();
  Duration _duration = new Duration();
  IconData iicon = Icons.play_circle_filled;
  bool isplaying = false;
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    _audio.seek(newDuration);
  }

  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    _audio = new AudioPlayer();
    _au = new AudioCache(fixedPlayer: _audio);
    _audio.durationHandler = (d) => setState(() {
          _duration = d;
        });

    _audio.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  List<String> stories = [
    '"I decided to smile\n for a minute"',
    '"I stopped using the\n word meditation"',
    '"I stayed up in on\n a saturday night"',
    '"I learned how to\n stay in the moment"',
    '"I found a solution \n for insomnia"',
    '"I realized meditation\n could solve my binge\n problem"',
    '"I used meditation\n to get over an illness"',
    '"I found a method\n that worked for me"',
    '"I used my nose and\n breath to make it work"',
  ];
  List<String> image_vol2 = [
    'https://images.unsplash.com/photo-1526779259212-939e64788e3c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80',
    "https://images.unsplash.com/photo-1512438248247-f0f2a5a8b7f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1499810631641-541e76d678a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1489659639091-8b687bc4386e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80",
    "https://images.unsplash.com/photo-1528715471579-d1bcf0ba5e83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1070&q=80"
  ];
  List<String> populars = [
    'Start your day\ncorrect',
    'Improve your \nsleep',
    'Chill after your\nwork',
    'Relax & releive\nstress',
    'Exploring your\ninner self',
  ];
  List<String> audios = [
    'morning.mp3',
    'sleep.mp3',
    'afterwork.mp3',
    'reduceanxiety.mp3',
    'last.mp3'
  ];
  List<String> images = [
    "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80",
    "https://images.unsplash.com/photo-1588392382834-a891154bca4d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80",
    "https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1565118531796-763e5082d113?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1482192505345-5655af888cc4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=80",
    "https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
  ];
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return StreamBuilder<UserData>(
        stream: CreateData(uid: user.uid).datastream,
        builder: (context, snapshot) {
          UserData userdata = snapshot.data;
          GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
          if (snapshot.data != null) {
            return SafeArea(
              top: true,
              child: Scaffold(
                extendBodyBehindAppBar: true,
                key: scaffoldkey,
                drawer: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Drawerbuild(scaffoldkey: scaffoldkey, auth: _auth),
                ),
                body: Container(
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
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        centerTitle: true,
                        title: FadeAnimation(
                          1.0,
                          Text('Explore Plans',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23)),
                        ),
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          icon: Icon(MyFlutterApp.menu),
                          onPressed: () =>
                              scaffoldkey.currentState.openDrawer(),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: SizedBox(
                        height: MediaQuery.of(context).size.height / 17,
                      )),
                      SliverToBoxAdapter(
                        child: FadeAnimation(
                          1.0,
                          Align(
                            alignment: Alignment(-0.8, 0),
                            child: Text('Have a nice day,\n' + userdata.name,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                )),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 20.88)),
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment(-0.8, 0),
                          child: FadeAnimation(
                            1.2,
                            Text('Popular Meditation',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 23)),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 53),
                      ),
                      SliverToBoxAdapter(
                        child: FadeAnimation(
                          1.2,
                          Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Swiper(
                              itemCount: 5,
                              itemBuilder: (BuildContext contex, int index) {
                                return OpenContainer(
                                    useRootNavigator: true,
                                    closedColor: Colors.transparent,
                                    closedElevation: 0.0,
                                    closedBuilder: (BuildContext context,
                                        VoidCallback action) {
                                      return ClosedAudio(
                                          image_vol2: image_vol2,
                                          populars: populars,
                                          time: time,
                                          index: index);
                                    },
                                    openBuilder: (BuildContext context,
                                        VoidCallback action) {
                                      return Detailvol2(
                                          image_vol2, index, populars);
                                    });
                              },
                              viewportFraction: 0.6,
                              scale: 0.85,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 35.55)),
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment(-0.8, 0),
                          child: FadeAnimation(
                            1.3,
                            Text('Inspirational Stories',
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 23)),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 37.64)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext, index) {
                            return OpenContainer(
                              useRootNavigator: true,
                              closedColor: Colors.transparent,
                              closedElevation: 0.0,
                              closedBuilder: (context, VoidCallback action) {
                                return ClosedStory(
                                    images: images,
                                    stories: stories,
                                    index: index);
                              },
                              openBuilder: (context, VoidCallback action) {
                                return StreamProvider<List<bool>>.value(
                                  value:
                                      CreateData(uid: user.uid).favoritestream,
                                  child: DetailStory(
                                    images: images,
                                    stories: stories,
                                    index: index,
                                  ),
                                );
                              },
                            );
                          },
                          childCount: 6,
                          addRepaintBoundaries: true,
                          addAutomaticKeepAlives: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Splosh();
          }
        });
  }
}
