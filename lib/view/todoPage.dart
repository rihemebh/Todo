import 'package:flutter/material.dart';
import 'package:todo/DAO/dbHelper.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/view/todoWidget.dart';

import 'dialog.dart';

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
    }
  }

  @override
  Widget build(BuildContext context) {
    TodoDialog dialog;
    showData();
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
      body: ListView.builder(
          itemCount: todos != null ? todos.length : 1,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index].id.toString()),
              onDismissed: (direction) {
                db.deleteTodo(todos[index]);
                setState(() {
                  todos.removeAt(index);
                });
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                        child: TodoWidget(
                            todo: todos != null ? todos[index] : null,
                            taskId: widget.task.id),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffd3a2e4),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  dialog.buildDialog(context, ToDo(), widget.task.id));
        },
        child: Center(child: Icon(Icons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          /*child: Row(
              children: [
                IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.home)),
                    
                IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.calendar_today)),
              ],
            )*/
        ),
      ),
    );
  }
}
