import 'package:flutter/material.dart';
import 'package:todo/DAO/dbHelper.dart';
import 'package:todo/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final ToDo todo;
  final int taskId;
  const TodoWidget({Key key, this.todo, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBaseHelper db = DataBaseHelper();
    return Container(
      child: TextField(
          controller: TextEditingController()
            ..text = todo != null ? todo.title : "",
          decoration: InputDecoration(
            hintText: "Add a new todo ",
            border: InputBorder.none,
          ),
          onSubmitted: (value) async {
            if (todo == null) {
              await db.insertTodo(
                  ToDo(title: value, taskId: this.taskId, isDone: 1));
            } else {}
          }),
    );
  }
}
