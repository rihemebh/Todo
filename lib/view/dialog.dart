import 'package:flutter/material.dart';

class TaskDialog {
  final txtTitle = TextEditingController();
  final txtDescription = TextEditingController();
  Widget buildDialog() {
    return AlertDialog(
        title: Text("Add a new Task"),
        content: SingleChildScrollView(
            child: Column(children: [
          TextField(
            controller: txtTitle,
            decoration: InputDecoration(hintText: "Task Name"),
          ),
          TextField(
            controller: txtDescription,
            decoration: InputDecoration(hintText: "Description"),
          ),
        ])));
  }
}

class TodoDialog {
  final txtTitle = TextEditingController();

  Widget buildDialog() {
    return AlertDialog(
        title: Text("Add a new Todo"),
        content: SingleChildScrollView(
            child: Column(children: [
          TextField(
            controller: txtTitle,
            decoration: InputDecoration(hintText: "What you want to do ?"),
          ),
        ])));
  }
}
