import 'package:flutter/material.dart';
import 'package:todo/Widgets.dart';
import 'package:todo/databaseHelper.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/models/Todo.dart';
import 'package:todo/views/homepage.dart';

class TaskPage extends StatefulWidget {
  final Task task;
  TaskPage({@required this.task});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String taskTitle = "";
  DataBaseHelper db = new DataBaseHelper();

  @override
  void initState() {
    if (widget.task != null) {
      taskTitle = widget.task.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: Stack(
          children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 29,
                  horizontal: 24,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homepage(),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 16,
                        ),
                        child: Image(
                          image:
                              AssetImage('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      onSubmitted: (value) async {
                        if (value != "") {
                          if (widget.task == null) {
                            DataBaseHelper dbHelper = DataBaseHelper();
                            Task newTask = new Task(title: value);
                            await dbHelper.insertTask(newTask);
                            print("new task has been created");
                          }
                        }
                      },
                      controller: TextEditingController()..text = taskTitle,
                      decoration: InputDecoration(
                        hintText: "What You need to do? ",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color(0xFF211551),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter description ...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 25,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
               Expanded(
                child: ScrollConfiguration(
                    behavior: NoGlowBehaviour(),
                    child: FutureBuilder(
                        initialData: [],
                        future: db.getTodo(),
                        builder: (context, snapshot) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Todo(
                                  text: snapshot.data[index].title,
                                  isDone: snapshot.data[index].isDone == 0
                                      ? false
                                      : true,
                                );
                              },
                            ),
                          );
                        }
                        )
                        )),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xFF86829D),
                        width: 1.5,
                      ),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/check_icon.png'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) async {
                        if (value != "") {
                          if (widget.task != null) {
                            DataBaseHelper dbHelper = DataBaseHelper();
                            ToDo todo = new ToDo(
                                title: value,
                                isDone: 0,
                                taskId: widget.task.id);
                            await dbHelper.insertTodo(todo);
                            setState(() {});
                            print("new todo has been created");
                          }
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Add a Todo..",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )
            ]),
           
            Positioned(
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homepage(),
                      ));
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
                      /* gradient: LinearGradient(
                          colors: [
                            Color(0xFFFE3577),
                            Color(0xFF642FDB),
                          ],
                          begin : Alignment(0.0, -1),end: Alignment(0.0, 1),
                        ),*/
                      borderRadius: BorderRadius.circular(20)),
                  child: Image(
                    image: AssetImage('assets/images/delete_icon.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
