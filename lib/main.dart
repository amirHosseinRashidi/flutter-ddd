import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ddd/post/presentation/home/home_page.dart';
import './injections.dart' as di;

Future<void> main() async {
  // initialize dependencies injections
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce DDD',
      theme: ThemeData(
        primaryColor: Colors.grey[50],
        accentColor: Colors.grey[50],
      ),
      home: HomePage(),
    );
  }
}
