import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:todo/TaskPage.dart';
import 'package:todo/views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
      ),
      home: homepage(),
    );
  }
}
