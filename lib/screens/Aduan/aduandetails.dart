import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/aduanmodel.dart';
import 'package:intl/intl.dart';
import './addAduan.dart';

class AduanDetailScreen extends StatefulWidget {
  static const routeName = '/aduan-detail';

  @override
  _AduanDetailScreenState createState() => _AduanDetailScreenState();
}

class _AduanDetailScreenState extends State<AduanDetailScreen> {
  Future<AduanList> futureAduan;

  @override
  void initState() {
    super.initState();
    futureAduan = fetchAduan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aduan ICT'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              Navigator.of(context).pushNamed(AddAduanPage.routeName);
            },
          ),
        ],
      ),
      body: Center(
          child: FutureBuilder<AduanList>(
        future: futureAduan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data.aduanList.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(snapshot.data.aduanList[index].namaPengadu +
                          ' (' +
                          snapshot.data.aduanList[index].nouser +
                          ')'),
                      subtitle: Text(snapshot.data.aduanList[index].aduan +
                          '\n' +
                          DateFormat.yMMMMEEEEd()
                              .add_jms()
                              .format(snapshot.data.aduanList[index].created)
                              .toString()),
                      isThreeLine: true,
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    AddAduanPage.routeName,
                                    arguments:
                                        snapshot.data.aduanList[index].id);
                              },
                              color: Theme.of(context).primaryColor,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                              color: Theme.of(context).errorColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* Row(
                        children: <Widget>[
                          Text('Nama Pengadu : '),
                          Text(snapshot.data.aduanList[index].namaPengadu + ' (' + snapshot.data.aduanList[index].nouser + ')' ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Perkara aduan : '),
                          Text(snapshot.data.aduanList[index].aduan),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Masa : '),
                          Text(DateFormat.yMMMMEEEEd().add_jms().format(snapshot.data.aduanList[index].created).toString()),
                        ],
                      ),                 */
                    Divider(),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      )),
    );
  }
}

Future<AduanList> fetchAduan() async {
  final response =
      await http.get('https://raub.uitm.edu.my/aduanapi/read.php?');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return AduanList.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}
