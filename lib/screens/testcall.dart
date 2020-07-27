import 'package:flutter/material.dart';
//untuk call

class Pengurusanakapen extends StatelessWidget {
  static const routeName = '/testcall';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(            
            title: Image.asset(
              'assets/logo3.png',
              fit: BoxFit.cover,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.3, 0.5, 0.9],
            colors: [
              Colors.teal[600],
              Colors.teal[600],
              Colors.teal[400],
              Colors.teal[200]
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80), //space

            Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.purple,
                gradient: new LinearGradient(
                  colors: [Colors.purple[200], Colors.cyan],
                ),
              ),
              child: ExpansionTile(
                title: Text('KOORDINATOR / KETUA PROGRAM'),
                children: <Widget>[
                  const SizedBox(height: 20), //space

                  ListTile(
                    leading: Container(
                        width: 75.0,
                        height: 75.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/suria.jpg')))),
                    title: Text(
                      'PUAN SURIA BINTI SULAIMAN',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'KOORDINATOR KEUSAHAWANAN',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'suriasul@uitm.edu.my',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.black,
                          size: 26,
                        ),
                        onPressed: null),
                  ),

                  const SizedBox(height: 10), //space

                  ListTile(
                    leading: Container(
                        width: 75.0,
                        height: 75.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/zamri.jpg')))),
                    title: Text(
                      'EN. ZAMRI BIN AHMAD',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'KOORDINATOR UNIT KOMUNIKASI KORPORAT',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'zamri.ahmad@uitm.edu.my',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.black,
                          size: 26,
                        ),
                        onPressed: null),
                  ),

                  const SizedBox(height: 10), //space
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
