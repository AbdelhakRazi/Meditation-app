import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/FadeAnimation.dart';

class ClosedStory extends StatelessWidget {
  const ClosedStory({
    Key key,
    @required this.images,
    @required this.stories,
    @required this.index,
  }) : super(key: key);

  final List<String> images;
  final List<String> stories;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23),
      child: FadeAnimation(
        1.2,
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 3.33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 28,
                            spreadRadius: 0.5,
                            offset: Offset(0, 2),
                            color: Colors.black.withOpacity(0.5),
                          )
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              images[index],
                            ),
                            fit: BoxFit.cover))),
                SizedBox(width: MediaQuery.of(context).size.width / 9.72),
                Text(stories[index],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'nexa',
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD1DBBD))),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30)
          ],
        ),
      ),
    );
  }
}
