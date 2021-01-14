import 'package:flutter/material.dart';
import 'package:todo/Widgets.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          color: Color(0xFFF6F6F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              //23:43
              TaskCard(title: "First Task", desc: "hello"),
              TaskCard(),
              TaskCard(),
            ],
          ),
        ),
      ),
    );
  }
}
