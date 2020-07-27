import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:test_app/models/aduanmodel.dart';

class AddAduanPage extends StatefulWidget {
  static const routeName = '/add-aduan';

  @override
  _AddAduanPageState createState() => _AddAduanPageState();
}

class _AddAduanPageState extends State<AddAduanPage> {
  final _namaFocusNode = FocusNode();
  final _aduanFocusNode = FocusNode();
  final _namaController = TextEditingController();
  final _nouserController = TextEditingController();
  final _aduanController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _namaFocusNode.dispose();
    _aduanFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    /* _form.currentState.save();
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    } */

    AduanModel aduan = new AduanModel(
      id: null,
      namaPengadu: _namaController.text,
      aduan: _aduanController.text,
      created: DateTime.now(),
      nouser: _nouserController.text,
    );

    createAduan(aduan).then((success) {
      if (success) {
        showDialog(
          builder: (context) => AlertDialog(
            title: Text('Aduan is created!'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          ),
          context: context,
        );
        return;
      } else {
        showDialog(
          builder: (context) => AlertDialog(
            title: Text('Error creating aduan!'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          ),
          context: context,
        );
        return;
      }
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aduan Baru'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            tooltip: 'Save',
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            padding: const EdgeInsets.all(5.0),
            children: <Widget>[
              TextFormField(
                controller: _nouserController,
                decoration: InputDecoration(labelText: 'No Staf'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_namaFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                textInputAction: TextInputAction.next,
                maxLength: 100,
                focusNode: _namaFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_aduanFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _aduanController,
                decoration: InputDecoration(labelText: 'Aduan'),
                textInputAction: TextInputAction.next,
                maxLines: 3,
                maxLength: 500,
                focusNode: _aduanFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

String postToJson(AduanModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

Future<bool> createAduan(AduanModel aduan) async {
  final response =
      await http.post('https://raub.uitm.edu.my/aduanapi/insert.php',
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: ''
          },
          body: postToJson(aduan));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
