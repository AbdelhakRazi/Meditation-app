import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meditation_app/active%20pages/Backend.dart';
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
            return Scaffold(
              extendBodyBehindAppBar: true,
              key: scaffoldkey,
              drawer: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Drawer(
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the drawer if there isn't enough vertical
                  // space to fit everything.
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFF193441)),
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 6),
                        Align(
                            alignment: Alignment(0, 0),
                            child: Text(
                              'Menu',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        Divider(
                          indent: MediaQuery.of(context).size.width / 7,
                          endIndent: MediaQuery.of(context).size.width / 8,
                          color: Colors.white,
                          thickness: 2.0,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.perm_identity,
                            size: 30,
                            color: Colors.white,
                          ),
                          title: Text('Profile',
                              style: TextStyle(
                                  fontFamily: 'nexa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          onTap: () {
                            Navigator.push(
                                context, FadeRoute(page: ProfileTab()));
                            scaffoldkey.currentState.openEndDrawer();
                            // ...
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.last_page,
                            size: 30,
                            color: Colors.white,
                          ),
                          title: Text('Sign out',
                              style: TextStyle(
                                  fontFamily: 'nexa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          onTap: () async {
                            await _auth.signOut();
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Colors.white,
                          ),
                          title: Text('About us',
                              style: TextStyle(
                                  fontFamily: 'nexa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
                                fontSize: MediaQuery.of(context).size.height /
                                    30.55)),
                      ),
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        icon: Icon(MyFlutterApp.menu),
                        onPressed: () => scaffoldkey.currentState.openDrawer(),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height / 15.06,
                    )),
                    SliverToBoxAdapter(
                      child: FadeAnimation(
                        1.0,
                        Align(
                          alignment: Alignment(-0.85, 0),
                          child: Text('Have a nice day,\n' + userdata.name,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 25.6,
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
                        alignment: Alignment(-0.85, 0),
                        child: FadeAnimation(
                          1.2,
                          Text('Popular Meditation',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 32)),
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
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  image_vol2[index]),
                                              fit: BoxFit.cover,
                                            )),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 35,
                                                left: 10,
                                                child: Text(populars[index],
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              30.55,
                                                      color: Colors.white,
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                    time[index].split(':')[0] +
                                                        ' minutes',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            42.66,
                                                        color: Colors.white
                                                            .withOpacity(0.7),
                                                        fontFamily: 'nexa',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )
                                            ],
                                          ),
                                        ));
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
                        alignment: Alignment(-0.85, 0),
                        child: FadeAnimation(
                          1.3,
                          Text('Inspirational Stories',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 32)),
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
                              return Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: FadeAnimation(
                                  1.2,
                                  Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.33,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 28,
                                                      spreadRadius: 0.5,
                                                      offset: Offset(0, 2),
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                    )
                                                  ],
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        images[index],
                                                      ),
                                                      fit: BoxFit.cover))),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  9.72),
                                          Text(stories[index],
                                              style: TextStyle(
                                                  fontFamily: 'nexa',
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          35.55,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFD1DBBD))),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30)
                                    ],
                                  ),
                                ),
                              );
                            },
                            openBuilder: (context, VoidCallback action) {
                              return StreamProvider<List<bool>>.value(
                                value: CreateData(uid: user.uid).favoritestream,
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
            );
          } else {
            return Splosh();
          }
        });
  }
}

class DetailStory extends StatefulWidget {
  @override
  List<String> images;
  List<String> stories;
  int index;
  DetailStory({
    this.images,
    this.stories,
    this.index,
  });
  _DetailStoryState createState() => _DetailStoryState();
}

class _DetailStoryState extends State<DetailStory> {
  @override
  String data;
  fetchdata() async {
    String responstext;
    responstext =
        await rootBundle.loadString('assets/story${widget.index + 1}.txt');
    setState(() {
      data = responstext;
    });
  }

  void initState() {
    fetchdata();

    super.initState();
  }

  Widget build(BuildContext context) {
    final favdata = Provider.of<List<bool>>(context);
    final user = Provider.of<FirebaseUser>(context);
    bool changecolor = false;
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.images[widget.index]),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                            bottom: -20,
                            right: MediaQuery.of(context).size.width / 15,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: favdata[widget.index]
                                      ? Colors.red
                                      : Color(0xFF193441)),
                              child: Center(
                                child: IconButton(
                                    onPressed: () async {
                                      await CreateData(uid: user.uid)
                                          .updatefavorite(
                                              !favdata[widget.index],
                                              widget.index);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.height /
                                          23,
                                    )),
                              ),
                            )),
                      ],
                    )),
                SizedBox(height: MediaQuery.of(context).size.height / 84),
                Align(
                  alignment: Alignment(-0.85, 0),
                  child: Text('MY STORY',
                      style: TextStyle(
                          color: Color(0xFF3E606F),
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height / 46.66)),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text(widget.stories[widget.index],
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xFF193441),
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height / 26.66)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 84),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 20,
                  ),
                  child: Text(data,
                      style: TextStyle(
                          height: 1.3,
                          color: Color(0xFF3E606F),
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.normal,
                          fontSize:
                              MediaQuery.of(context).size.height / 35.66)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 84),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Detailvol2 extends StatefulWidget {
  @override
  List<String> image_vol2;
  List<String> populars;
  int index;
  Detailvol2(List<String> image_vol2, int index, List<String> populars) {
    this.image_vol2 = image_vol2;
    this.index = index;
    this.populars = populars;
  }
  _Detailvol2State createState() => _Detailvol2State();
}

class _Detailvol2State extends State<Detailvol2> {
  @override
  List<String> audios = [
    'morning.mp3',
    'sleep.mp3',
    'afterwork.mp3',
    'reduceanxiety.mp3',
    'last.mp3'
  ];
  List<String> time = ['05:16', '12:23', '06:25', '10:20', '03:14'];

  AudioPlayer _audio;
  AudioCache _au;
  Duration _position = new Duration();
  Duration _duration = new Duration();
  IconData iicon = MyFlutterApp.play_circle;
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

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.image_vol2[widget.index]),
            fit: BoxFit.fill,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25.06,
                ),
                FadeAnimation(
                  0.5,
                  Align(
                    alignment: Alignment(0, 0),
                    child: new Image.asset('assets/1x/logoblanc.png',
                        height: MediaQuery.of(context).size.height / 19.39),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 6),
                  child: Row(
                    children: [
                      FadeAnimation(
                        0.5,
                        Icon(Icons.headset,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height / 10.8),
                      ),
                      FadeAnimation(
                        0.5,
                        Text(widget.populars[widget.index],
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.height /
                                    26.66)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25.33),
                FadeAnimation(
                  0.5,
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(widget.image_vol2[widget.index]),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 28,
                                offset: Offset(0, 6),
                                color: Colors.black.withOpacity(0.5))
                          ],
                          borderRadius: BorderRadius.circular(24))),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 21.33),
                FadeAnimation(
                  0.5,
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 15,
                      overlayColor: Colors.transparent,
                      minThumbSeparation: 100,
                      rangeThumbShape: RoundRangeSliderThumbShape(
                        enabledThumbRadius: 10,
                        disabledThumbRadius: 10,
                      ),
                    ),
                    child: Slider.adaptive(
                      value: _position.inSeconds.toDouble(),
                      activeColor: Color(0xFF5F808F),
                      inactiveColor: Colors.white,
                      min: 0,
                      max: _duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          seekToSecond(value.toInt());
                          value = value;
                        });
                      },
                    ),
                  ),
                ),
                FadeAnimation(
                  0.5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: _position.inMinutes
                                          .remainder(60)
                                          .toString()
                                          .padLeft(2, "0") +
                                      ':' +
                                      _position.inSeconds
                                          .remainder(60)
                                          .toString()
                                          .padLeft(2, "0"),
                                  style: TextStyle(
                                      fontFamily: 'nexa',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              32)),
                              TextSpan(
                                  text: ' / ' + time[widget.index],
                                  style: TextStyle(
                                      fontFamily: 'nexa',
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              37.64)),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(iicon),
                          iconSize: MediaQuery.of(context).size.height / 13,
                          color: Colors.white,
                          autofocus: true,
                          onPressed: () {
                            if (isplaying) {
                              _audio.pause();
                              setState(() {
                                isplaying = false;
                                iicon = MyFlutterApp.play_circle;
                              });
                            } else {
                              _au.play(audios[widget.index]);
                              setState(() {
                                isplaying = true;
                                iicon = MyFlutterApp.pause_circle;
                              });
                            }
                          }),
                    ],
                  ),
                ),
                /* SizedBox(height: MediaQuery.of(context).size.height / 21.33),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
