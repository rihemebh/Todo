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
    return (this.todo != null)
        ? Row(
            children: [
              InkWell(
                onTap: () {
                  db.insertTodo(new ToDo(
                      id: todo.id,
                      title: todo.title,
                      taskId: todo.taskId,
                      isDone: 1 - todo.isDone));
                },
                child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: (todo.isDone == 1)
                        ? Icon(
                            Icons.check_box,
                            color: Color(0xffa2c8a2),
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            color: Color(0xff3d3d3d),
                          )),
              ),
              Expanded(
                child: TextField(
                    controller: TextEditingController()..text = this.todo.title,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) async {
                      if (todo == null) {
                        await db.insertTodo(
                            ToDo(title: value, taskId: this.taskId, isDone: 0));
                      } else {}
                    }),
              ),
            ],
          )
        : Container();
  }
}
