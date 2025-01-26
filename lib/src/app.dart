import 'package:flutter/material.dart';
import 'package:tether/src/ui/pages/welcome_page.dart'; // Updated with the correct package name

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tether',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomescreenWidget(), // Change to WelcomescreenWidget
    );
  }
}
