import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/getting_started_screen.dart';

void main() => runApp(const DoorstepApp());

class DoorstepApp extends StatelessWidget {
  const DoorstepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doorstep',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const GettingStartedScreen(),
    );
  }
}