import 'package:flutter/material.dart';
import 'package:meditation_app/Animation/fadetransition.dart';
import 'package:meditation_app/Profile_Pages/ProfilePage.dart';
import 'package:meditation_app/authentication/auth.dart';

class Drawerbuild extends StatelessWidget {
  const Drawerbuild({
    Key key,
    @required this.scaffoldkey,
    @required Authentication auth,
  })  : _auth = auth,
        super(key: key);

  final GlobalKey<ScaffoldState> scaffoldkey;
  final Authentication _auth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF193441)),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 6),
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
            SizedBox(height: MediaQuery.of(context).size.height / 20),
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
                Navigator.push(context, FadeRoute(page: ProfileTab()));
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
              onTap: () {print(MediaQuery.of(context).size.height);
              print(MediaQuery.of(context).size.width);
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
