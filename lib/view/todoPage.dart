import 'package:flutter/material.dart';
import 'package:todo/DAO/dbHelper.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/view/todoWidget.dart';

class TodoPage extends StatefulWidget {
  final Task task;
  TodoPage({Key key, @required this.task}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  DataBaseHelper db = DataBaseHelper();
  List<ToDo> todos;
  Future showData() async {
    if (widget.task != null) {
      todos = await db.getTodo(widget.task.id);
      setState(() {
        todos = todos;
      });
      print(todos);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: TextEditingController()
            ..text = widget.task != null ? widget.task.title : "",
          decoration: InputDecoration(
            hintText: "What you want to do ?",
            border: InputBorder.none,
          ),
          onSubmitted: (value) async {
            if (widget.task == null) {
              await db.insertTask(new Task(title: value));
            } else {
              await db.updateTask(Task(
                  id: widget.task.id,
                  description: widget.task.description,
                  title: value));
            }
          },
        ),
        backgroundColor: Color(0xffd3a2e4),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 29,
              vertical: 32,
            ),
            margin: EdgeInsets.all(15),
            child: TextField(
              controller: TextEditingController()
                ..text = widget.task != null ? widget.task.description : "",
              decoration: InputDecoration(
                hintText: "Write a description ",
                border: InputBorder.none,
              ),
              onSubmitted: (value) async {
                if (widget.task == null) {
                  await db.insertTask(new Task(description: value));
                } else {
                  await db.updateTask(Task(
                      id: widget.task.id,
                      description: value,
                      title: widget.task.title));
                }
              },
            ),
          ),
          Container(
              height: 200,
              padding: EdgeInsets.symmetric(
                horizontal: 29,
                vertical: 32,
              ),
              margin: EdgeInsets.all(8),
              child: (widget.task != null)
                  ? ListView.builder(
                      itemCount: todos != null ? todos.length : 1,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          child: Container(
                            child: TodoWidget(
                                todo: todos != null ? todos[index] : null,
                                taskId: widget.task.id),
                          ),
                        );
                      })
                  : Text("empty"))
        ],
      ),
    );
  }
}
