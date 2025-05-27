import 'package:flutter/material.dart';
import 'package:tether/src/app.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Force full-screen mode and allow the app to extend into the notch area
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make status bar transparent
    systemNavigationBarColor: Colors.transparent, // Make bottom nav bar transparent
    systemNavigationBarIconBrightness: Brightness.light, // Set icons to light
    statusBarIconBrightness: Brightness.light, // Set status bar icons to light
  ));

  runApp(TetherApp());
}

class TetherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tether',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set default background color to white for consistency
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF2C2C2C), // Set primary color for consistency with login page elements
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(), // Ensure App widget supports full screen
    );
  }
}
