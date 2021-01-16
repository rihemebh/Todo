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

class Todo extends StatelessWidget {
  final String text;
  final bool isDone;
  Todo({this.text, @required this.isDone});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(
              right: 12,
            ),
            decoration: BoxDecoration(
              color: isDone ? Color(0xFF7349FE) : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: isDone
                  ? null
                  : Border.all(
                      color: Color(0xFF86829D),
                      width: 1.5,
                    ),
            ),
            child: Image(
              image: AssetImage('assets/images/check_icon.png'),
            ),
          ),
          Text(
            text ?? "(New Task)",
            style: TextStyle(
              color: isDone ? Color(0xFF211551) : Color(0xFF86829D),
              fontSize: 16,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
