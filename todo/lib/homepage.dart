import 'package:flutter/material.dart';
import 'package:todo/Widgets.dart';

// ignore: camel_case_types
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  TaskCard(title: "First Task", desc: "hello"),
                  TaskCard(),
                  TaskCard(),
                ],
              ),
              //23:43
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFF7349FE),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image(
                    image: AssetImage('assets/images/add_icon.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
