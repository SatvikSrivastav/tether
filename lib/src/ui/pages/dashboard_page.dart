import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // Using the theme defined in main.dart for consistent colors
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      // Scaffold background color will use the theme's scaffoldBackgroundColor
      appBar: AppBar(
        title: const Text('User Dashboard'),
        // AppBar will use the theme's primary color by default
      ),
      body: Center(
        child: Text(
          'Welcome to the User Dashboard!',
          style: theme.textTheme.bodyMedium, // Use a text style from the theme
        ),
      ),
    );
  }
}