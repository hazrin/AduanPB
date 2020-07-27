import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  static const routeName = '/call';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PEJABAT POLIS BANTUAN'),
      ),
      body: Container(
        /* decoration: BoxDecoration(
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
        ), */
        child: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text('PAHANG'),
              children: <Widget>[
                ListTile(
                  title: Text('KAMPUS JENGKA'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.call,
                    ),
                    onPressed: () async {
                      String telephoneUrl = "tel:094602444";

                      try {
                        await launch(telephoneUrl);
                      } catch (ex) {
                        throw ex.toString();
                      }
                    },
                    //=> _service.call('094602444'),
                  ),
                ),
                ListTile(
                  title: Text('KAMPUS RAUB'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.call,
                    ),
                    onPressed: () async {
                      String telephoneUrl = "tel:093515600";

                      try {
                        await launch(telephoneUrl);
                      } catch (ex) {
                        throw ex.toString();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
