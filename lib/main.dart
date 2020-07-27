import 'package:flutter/material.dart';
import 'package:test_app/screens/home.dart';
import 'package:test_app/Screens/aboutUs.dart';
import 'package:test_app/Screens/call.dart';
import 'package:test_app/Screens/aduan/addAduan.dart';
import 'package:test_app/Screens/aduan/aduandetails.dart';
import 'package:test_app/screens/login/login_page.dart';
import 'package:test_app/screens/rootpage.dart';
import 'package:test_app/screens/testcall.dart';
import './auth/authentication.dart';
import 'screens/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), //RootPage(auth: new Auth()),
      routes: {
        AddAduanPage.routeName: (ctx) => AddAduanPage(),
        AduanDetailScreen.routeName: (ctx) => AduanDetailScreen(),
        CallScreen.routeName: (ctx) => CallScreen(),
        AboutUs.routeName: (ctx) => AboutUs(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        Pengurusanakapen.routeName: (ctx) => Pengurusanakapen(),
        LoginPage.routeName: (ctx) => LoginPage(),
      },
    );
  }
}
