import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';
import 'package:meditation_app/my_flutter_app_icons.dart';
import 'dart:ui';

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
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 10),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeAnimation(
                  0.5,
                  new Image.asset('assets/1x/logoblanc.png',
                      height: MediaQuery.of(context).size.height / 19.39),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              fontSize: 23)),
                    ),
                  ],
                ),
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
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Wrap(
                    runSpacing: 0,
                    runAlignment: WrapAlignment.start,
                    children: [
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
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
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
                                            fontSize: 17)),
                                    TextSpan(
                                        text: ' / ' + time[widget.index],
                                        style: TextStyle(
                                            fontFamily: 'nexa',
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(iicon),
                                  iconSize: 40,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
