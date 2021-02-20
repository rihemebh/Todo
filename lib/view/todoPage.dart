import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("task"),
        backgroundColor: Color(0xffd3a2e4),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 29,
            vertical: 32,
          ),
          margin: EdgeInsets.all(15),
          child: Text("i am the todo page :p",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))),
    );
  }
}
