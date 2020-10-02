import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:meditation_app/DatabaseManagament/Backend.dart';
import 'package:meditation_app/Profile_Pages/EditProfile.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:io';
import 'package:meditation_app/Animation/fadetransition.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  CreateData _data = CreateData();
  int coulor1 = 0xFF5F808F;
  int coulor2 = 0xFF193441;
  CalendarController _controller;
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return StreamBuilder<UserData>(
        stream: CreateData(uid: user.uid).datastream,
        builder: (context, snapshot) {
          UserData userdata = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height / 30.55)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, FadeRoute(page: EditProfile()));
                  },
                )
              ],
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
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 8),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 6.73,
                    backgroundColor: Colors.white,
                    backgroundImage: userdata.url != null
                        ? CachedNetworkImageProvider(
                            userdata.url,
                          )
                        : AssetImage('assets/illustration.png'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 37.64,
                  ),
                  Text(
                    userdata.name,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 30),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20.64,
                  ),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Text('Your Daily Activity',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 32)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24.61,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 2.83,
                            width: MediaQuery.of(context).size.width / 2.33,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      53.33,
                                ),
                                Text(
                                  'TODAY',
                                  style: TextStyle(
                                      color: Color(0xFF193441),
                                      fontFamily: 'nexa',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      17.77,
                                ),
                                AnimatedCircularChart(
                                  holeRadius: 25,
                                  size: Size(200, 100),
                                  initialChartData: <CircularStackEntry>[
                                    new CircularStackEntry(
                                      <CircularSegmentEntry>[
                                        new CircularSegmentEntry(
                                          50,
                                          Color(0xFF19588F),
                                          rankKey: 'completed',
                                        ),
                                        new CircularSegmentEntry(
                                          80.67,
                                          Color(0xFFE5E5E5),
                                          rankKey: 'remaining',
                                        ),
                                      ],
                                      rankKey: 'progress',
                                    ),
                                  ],
                                  chartType: CircularChartType.Radial,
                                  percentageValues: true,
                                  edgeStyle: SegmentEdgeStyle.round,
                                  holeLabel: '1/3',
                                  labelStyle: new TextStyle(
                                    fontFamily: 'nexa',
                                    color: Colors.blueGrey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('Sessions',
                                          style: TextStyle(
                                              color: Color(0xFF193441),
                                              fontFamily: 'nexa',
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  48)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '2 Times',
                                        style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontFamily: 'nexa',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                48),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('Durations',
                                          style: TextStyle(
                                              color: Color(0xFF193441),
                                              fontFamily: 'nexa',
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  48)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '38 minutes',
                                        style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontFamily: 'nexa',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                48),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 2.83,
                            width: MediaQuery.of(context).size.width / 2.33,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      53.33,
                                ),
                                Text(
                                  'YESTERDAY',
                                  style: TextStyle(
                                      color: Color(0xFF193441),
                                      fontFamily: 'nexa',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      17.77,
                                ),
                                AnimatedCircularChart(
                                  holeRadius: 25,
                                  size: Size(200, 100),
                                  initialChartData: <CircularStackEntry>[
                                    new CircularStackEntry(
                                      <CircularSegmentEntry>[
                                        new CircularSegmentEntry(
                                          50,
                                          Color(0xFF73A2BF),
                                          rankKey: 'completed',
                                        ),
                                        new CircularSegmentEntry(
                                          80.67,
                                          Color(0xFFE5E5E5),
                                          rankKey: 'remaining',
                                        ),
                                      ],
                                      rankKey: 'progress',
                                    ),
                                  ],
                                  chartType: CircularChartType.Radial,
                                  percentageValues: true,
                                  edgeStyle: SegmentEdgeStyle.round,
                                  holeLabel: '1/3',
                                  labelStyle: new TextStyle(
                                    fontFamily: 'nexa',
                                    color: Colors.blueGrey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('Sessions',
                                          style: TextStyle(
                                              color: Color(0xFF193441),
                                              fontFamily: 'nexa',
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  48)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '2 Times',
                                        style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontFamily: 'nexa',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                48),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('Durations',
                                          style: TextStyle(
                                              color: Color(0xFF193441),
                                              fontFamily: 'nexa',
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  48)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '38 minutes',
                                        style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontFamily: 'nexa',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                48),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          );
        });
  }
}
