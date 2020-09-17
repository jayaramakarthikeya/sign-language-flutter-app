import 'package:SignLanguage/pages/about.dart';
import 'package:SignLanguage/pages/home.dart';
import 'package:SignLanguage/pages/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/about': (context) => About(),
    },
  ));
}
