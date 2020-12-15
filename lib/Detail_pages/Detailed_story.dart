import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/DatabaseManagament/Backend.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;

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
                            child: IconButton(
                                onPressed: () async {
                                  await CreateData(uid: user.uid)
                                      .updatefavorite(
                                          !favdata[widget.index], widget.index);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: MediaQuery.of(context).size.height / 84),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text('MY STORY',
                      style: TextStyle(
                          color: Color(0xFF3E606F),
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Text(widget.stories[widget.index],
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xFF193441),
                          fontWeight: FontWeight.bold,
                          fontSize: 23)),
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
                          fontSize: 17)),
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
