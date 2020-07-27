import 'dart:io';

//import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/networkUtils.dart';
import '../models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final LOGIN_URL = "https://api.uitm.edu.my/stars/login";
  static final _API_KEY =
      "token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXJpYWwiOjEsImNyZWF0ZWRfYnkiOiJJbnRlZ3Jhc2kiLCJ1c2VyIjoia2FtcHVzIHJhdWIiLCJ1cmwiOlsiL3N0YXJzL2xvZ2luIiwiL3N0dWRlbnQvcG9ydGFsX2xvZ2luVjIiXSwicGVtb2hvbiI6ImhhenJpbiJ9.S1nbq91llFSFIudXMjTtOruntMzXK3gKiwG64no749Y";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password
    }, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: _API_KEY,
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}
