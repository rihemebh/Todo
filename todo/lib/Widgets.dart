import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String desc;
  TaskCard({this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Unnamed task",
              style: TextStyle(
                color: Color(0xFF211551),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                desc ?? "I am an empty task click Me to add description !",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF86829D),
                  height: 1.5,
                ),
              ),
            )
          ],
        ));
  }
}
