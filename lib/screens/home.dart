import 'package:flutter/material.dart';
import 'package:test_app/Screens/aboutUs.dart';
import 'package:test_app/screens/Aduan/addAduan.dart';
import 'package:test_app/screens/login/login_page.dart';
import 'package:test_app/screens/login/sign_in.dart';
import 'package:test_app/screens/testcall.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Aduan/aduandetails.dart';
import 'call.dart';
import 'login/login_screen.dart';
import '../auth/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  HomeScreen({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final FirebaseDatabase _database = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aduan'),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.comments),
            tooltip: 'Aduan',
            onPressed: () {
              Navigator.of(context).pushNamed(AddAduanPage.routeName);
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.listAlt),
            tooltip: 'Aduan',
            onPressed: () {
              Navigator.of(context).pushNamed(AduanDetailScreen.routeName);
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.user),
            tooltip: 'login',
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('$name'),
                  Text('$email'),
                  RaisedButton(
                    onPressed: () {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }), ModalRoute.withName('/'));
                    },
                    color: Colors.deepPurple,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign out',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed(Pengurusanakapen.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Sos Call'),
              onTap: () {
                Navigator.of(context).pushNamed(CallScreen.routeName);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text('Facebook'),
              onTap: () async {
                const url =
                    'https://www.facebook.com/UiTMPahangAuxiliaryPolice';

                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.users),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pushNamed(AboutUs.routeName);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: new Text("Welcome home!"),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            title: Text('Aduan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Camera'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).pushNamed(AduanDetailScreen.routeName);
          } else {
            _onItemTapped(value);
          }
        },
      ), */
    );
  }
}
