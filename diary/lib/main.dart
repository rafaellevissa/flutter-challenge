import 'package:flutter/material.dart';
import 'package:diary/pages/form/form_page.dart';
import 'package:diary/pages/graph/graph_page.dart';

void main() {
  runApp(MyApp());
}

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => FormPage(),
  '/graph': (context) => GraphPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge flutter',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.grey,
      ),
      routes: routes,
    );
  }
}


