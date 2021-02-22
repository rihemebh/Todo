import 'package:flutter/material.dart';
import 'package:todo/DAO/dbHelper.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/todo.dart';

class TaskDialog {
  DataBaseHelper db = DataBaseHelper();
  final txtTitle = TextEditingController();
  final txtDescription = TextEditingController();
  Widget buildDialog(BuildContext context, Task task) {
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
          RaisedButton(
              child: Text('Save Task'),
              onPressed: () async {
                task.title = txtTitle.text;
                task.description = txtDescription.text;
                db.insertTask(task);

                Navigator.pop(context);
              }),
        ])));
  }
}

class TodoDialog {
  final txtTitle = TextEditingController();
  DataBaseHelper db = DataBaseHelper();

  Widget buildDialog(BuildContext context, ToDo todo, int id) {
    return AlertDialog(
        title: Text("Add a new Todo"),
        content: SingleChildScrollView(
            child: Column(children: [
          TextField(
            controller: txtTitle,
            decoration: InputDecoration(hintText: "What you want to do ?"),
          ),
          RaisedButton(
              child: Text('Save Task'),
              onPressed: () async {
                todo.title = txtTitle.text;
                todo.isDone = 0;
                todo.taskId = id;
                db.insertTodo(todo);

                Navigator.pop(context);
              }),
        ])));
  }
}
