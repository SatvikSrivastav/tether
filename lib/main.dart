import 'package:flutter/material.dart';
import 'package:tether/src/app.dart';
void main() {
  runApp(TetherApp());
}

class TetherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tether',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
