import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:meditation_app/DatabaseManagament/Backend.dart';
import 'package:meditation_app/Different_size.dart';
import 'package:meditation_app/Profile_Pages/EditProfile.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
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
    MediaQueryData queryData;
    final user = Provider.of<FirebaseUser>(context);
    return StreamBuilder<UserData>(
        stream: CreateData(uid: user.uid).datastream,
        builder: (context, snapshot) {
          UserData userdata = snapshot.data;
          return SafeArea(
            top: true,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: true,
                title: Text('Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 2.8 * SizeConfig.textMultiplier,
                    )),
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
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
                          height: MediaQuery.of(context).size.height * 0.03),
                      Text(userdata.name,
                          style: TextStyle(
                            fontFamily: 'nexa',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.3 * SizeConfig.textMultiplier,
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Text('Your Daily Activity',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 2.7 * SizeConfig.textMultiplier,
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    child: Text(
                                      'TODAY',
                                      style: TextStyle(
                                          color: Color(0xFF193441),
                                          fontFamily: 'nexa',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              2.5 * SizeConfig.textMultiplier),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: AnimatedCircularChart(
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
                                      fontSize: 2.8 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sessions',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xFF193441),
                                                  fontFamily: 'nexa',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 1.8 *
                                                      SizeConfig
                                                          .textMultiplier)),
                                          Text(
                                            '2 Times',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Color(0xFF757575),
                                                fontFamily: 'nexa',
                                                fontSize: 1.6 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Durations',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xFF193441),
                                                  fontFamily: 'nexa',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 1.8 *
                                                      SizeConfig
                                                          .textMultiplier)),
                                          Text(
                                            '38 minutes',
                                            style: TextStyle(
                                                color: Color(0xFF757575),
                                                fontFamily: 'nexa',
                                                fontSize: 1.6 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    child: Text(
                                      'YESTERDAY',
                                      style: TextStyle(
                                          color: Color(0xFF193441),
                                          fontFamily: 'nexa',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              2.5 * SizeConfig.textMultiplier),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: AnimatedCircularChart(
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
                                      fontSize: 2.8 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sessions',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xFF193441),
                                                  fontFamily: 'nexa',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 1.8 *
                                                      SizeConfig
                                                          .textMultiplier)),
                                          Text(
                                            '2 Times',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Color(0xFF757575),
                                                fontFamily: 'nexa',
                                                fontSize: 1.6 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Durations',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xFF193441),
                                                  fontFamily: 'nexa',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 1.8 *
                                                      SizeConfig
                                                          .textMultiplier)),
                                          Text(
                                            '38 minutes',
                                            style: TextStyle(
                                                color: Color(0xFF757575),
                                                fontFamily: 'nexa',
                                                fontSize: 1.6 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
