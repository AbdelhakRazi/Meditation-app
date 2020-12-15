import 'package:flutter/material.dart';

class ClosedAudio extends StatelessWidget {
  const ClosedAudio({
    Key key,
    @required this.image_vol2,
    @required this.populars,
    @required this.time,
    @required this.index,
  }) : super(key: key);

  final List<String> image_vol2;
  final List<String> populars;
  final List<String> time;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(image_vol2[index]),
              fit: BoxFit.cover,
            )),
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 35,
                left: 10,
                child: Text(populars[index],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(time[index].split(':')[0] + ' minutes',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'nexa',
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ));
  }
}
