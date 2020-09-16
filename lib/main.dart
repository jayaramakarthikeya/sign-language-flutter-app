import 'package:SignLanguage/pages/about.dart';
import 'package:SignLanguage/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/about': (context) => About(),
    },
  ));
}
